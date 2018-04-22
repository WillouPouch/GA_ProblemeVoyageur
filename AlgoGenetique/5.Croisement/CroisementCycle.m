%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Croisement par cycle
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = CroisementCycle(GAParameters, MP, nbVilles)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(MP,1);
pc = GAParameters.Pc;

Enfants = [];
listeInd = [];
nbTour = 1;

%-----------------------------------------
%	Boucle de cr�ation des enfants
%-----------------------------------------
for i = 1:2:popSize 
    %S�lection des couples de parents 
    P1 = MP(i,:);
    if(i < popSize)
        P2 = MP(i+1,:);
    else
        P2 = MP(randperm(nbVilles,1),:); %Un parent al�atoire
    end

    %Crossover avec probabilit� de croisement pc
    if(rand <= pc)
        Enfant = zeros(1,nbVilles);

        %Cr�ation de l'enfant
        while(size(unique(nonzeros(Enfant)),1) ~= nbVilles)
            %Init du locus de d�part, altern� entre les parents
            if(mod(nbTour,2) ~= 0)
                Pvalue = P1;
                Pindice = P2;
            else
                Pvalue = P2;
                Pindice = P1;
            end
            
            %Init du d�part du cycle virtuel
            for j = 1:size(Pvalue,2)
                if(isempty(find(listeInd == j)))
                    locusDebut = Pvalue(j);
                    indice = j;
                    
                    Enfant(indice) = locusDebut;
                    listeInd = [listeInd indice];
                    break;
                end
            end
            
            %Parcours du cycle virtuel
            while(locusDebut ~= Pindice(indice))
                indice = find(Pvalue == Pindice(indice));
                Enfant(indice) = Pvalue(indice);
                listeInd = [listeInd indice];
            end
            
            nbTour = nbTour + 1;
        end
    else
        Enfant = P1;
    end
    
    Enfants = [Enfants ; Enfant; P2];
    Enfant = [];
    listeInd = [];
    nbTour = 1;
end
