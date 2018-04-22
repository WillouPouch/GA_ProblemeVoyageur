%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Roulette Wheel Selection
%
%       Sélectionne les 'meilleurs' individus
%       et les mets dans le mating pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = RWS(P, nbVilles)

%-----------------------------------------
%   Init variables
%-----------------------------------------
MP = [];
popSize = size(P,1);
k = 0;
nbVillesCycle = nbVilles + 1;

%Matrice qui contient les pi
pi =  zeros(popSize,1);
%Matrice qui contient les pci
pci = zeros(popSize,1);

%Somme S de toutes les valeurs de fitness de la population
Sf = sum(P(:,nbVillesCycle+1));

%-----------------------------------------
%   Calcul de pi pour chaque individu i de P
%-----------------------------------------
for i = 1:popSize
   
    %pi = valeur de fitness / somme des valeurs de fitness
    pi(i,1) = P(i,nbVillesCycle+1)/Sf;

end

%-----------------------------------------
%   Calcul de pci pour chaque individu i de P
%-----------------------------------------
for i = 1:popSize
    
     %pci = somme cumulative des pi
     k = k + pi(i,1);
     pci(i,1) = k;
     
end

%-----------------------------------------
%   Tant que le mating pool est plus petit 
%   que la population initiale
%-----------------------------------------
while (size(abs(MP),1) < popSize)
    
    %On génère un nombre aléatoire
    r = rand;
    
    %Parcours des individus i de P 
    for i = 1:popSize
        
        %Borne supérieure pour le rand
        PciSup = pci(i,1);
            
        %1er élément
        if (i == 1)
            %Si le rand est inférieur à la borne
            if(r < PciSup)
                %On ajoute cet individu au mating pool
                MP = [MP; P(i,:)];
            end

        %Autres éléments
        else
            %Borne inférieure pour le rand
            PCiInf = pci(i-1,1);

            %Si le rand est entre les 2 bornes
            if(r > PCiInf && r < PciSup)
                %On ajoute cet individu au mating pool
                MP = [MP; P(i,:)];
            end
        end
    end
end

%-----------------------------------------
%   Suppresion des 2 dernieres colonnes (retour origine et distance)
%-----------------------------------------
MP(:,nbVillesCycle:end) = [];
