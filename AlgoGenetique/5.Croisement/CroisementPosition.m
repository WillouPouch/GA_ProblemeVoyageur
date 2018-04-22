%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Croisement par position
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = CroisementPosition(GAParameters, MP, nbVilles)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(MP,1);
pc = GAParameters.Pc;

Enfants = [];
E1 = [];
E2 = [];
locus = [];
locus2 = [];

%-----------------------------------------
%	Boucle de création des enfants
%-----------------------------------------
for i = 1:2:popSize 
    %Sélection des couples de parents 
    P1 = MP(i,:);
    if(i < popSize)
        P2 = MP(i+1,:);
    else
        P2 = MP(randperm(nbVilles,1),:); %Un parent aléatoire
    end

    %Crossover avec probabilité de croisement pc
    if(rand <= pc)
        %Etapes 1&2 : Sélection aléatoire de plusieurs locus du P1 &
        %génération d'un enfant partiel avec ces locus (et inversement)
        for k = 1:nbVilles
            if(rand > 0.5)
                E1 = [E1 P1(k)];
                E2 = [E2 P2(k)];
                locus = [locus P1(k)];
                locus2 = [locus2 P2(k)];
            else
                E1 = [E1 0]; %0 = locus pas sélectionné
                E2 = [E2 0]; %0 = locus pas sélectionné
            end
        end
        indNotLocus = find(E1==0); %indice des allèles non locus de E1
        indNotLocus2 = find(E2==0); %indice des allèles non locus de E2

        %Etape 3 : Marquer les allèles du P2 qui sont les locus du P1 (et inversement)
            %Pour E1
        for k = 1:nbVilles
            for m = 1:size(locus,2)
                %Si la valeur est égale à un des locus, on la met à 0
                if(P2(k) == locus(m))
                    P2(k) = 0;
                    break;
                end
            end
        end
            %Pour E2
        for k = 1:nbVilles
            for m = 1:size(locus2,2)
                %Si la valeur est égale à un des locus, on la met à 0
                if(P1(k) == locus2(m))
                    P1(k) = 0;
                    break;
                end
            end
        end

        %Etape 4 : Remplir enfant partiel avec allèles restantes (~=0) du
        %P2 (et inversement)
        for k = 1:nbVilles
            if(P2(k) ~= 0)
                E1(indNotLocus(1)) = P2(k);
                indNotLocus(1) = [];
            end
            
            if(P1(k) ~= 0)
                E2(indNotLocus2(1)) = P1(k);
                indNotLocus2(1) = [];
            end
        end
    else
        E1 = P1;
        E2 = P2;
    end
    
    Enfants = [Enfants ; E1 ; E2];
    E1 = [];
    E2 = [];
    locus = [];
    locus2 = [];
end
