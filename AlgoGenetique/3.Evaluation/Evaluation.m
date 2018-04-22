%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   �tape d'�valuation
%
%       Affectation d'une distance � chaque cycle Hamiltonien
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = Evaluation(nbVilles, Po, M)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(Po,1);
sum = 0;
nbVillesCycle = nbVilles + 1;

%-----------------------------------------
%	Ajout colonne = retour 1�re ville
%-----------------------------------------
for i = 1:popSize
    Po(i,nbVillesCycle) = Po(i,1);
end

%-----------------------------------------
%	Ajout colonne pour stocker la distance entre les villes du cycle hamiltonien
%-----------------------------------------
P = [Po zeros(popSize,1)];

%-----------------------------------------
%	Parcours de la population et calcul d'une distance pour chaque cycle
%-----------------------------------------
for i = 1:popSize
    
    %Contient l'ordre des villes pour chaque individu
    ordreVilles = P(i,1:nbVillesCycle);
   
    %On parcours les villes
    for j = 1:nbVillesCycle
        
        if (j < nbVillesCycle)
            %Calcul de la distance entre 2 villes cons�cutives
            dist = sqrt( (M(ordreVilles(j+1),1)-M(ordreVilles(j),1)).^2 + (M(ordreVilles(j+1),2)-M(ordreVilles(j),2)).^2 );
            sum = sum + dist;
        end
    end
    
    %On assigne le total des distances entre chaque ville � la derni�re colonne de P
    P(i,nbVillesCycle+1) = sum;
    sum = 0;
end
