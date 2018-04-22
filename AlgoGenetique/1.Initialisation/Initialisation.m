%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape d'initialisation
%
%       Génère des individus aléatoire
%       dans les limites du problème
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Po, M] = Initialisation(nbVilles, popSize)

%-----------------------------------------
%   Génération de coordonnées (x,y) de villes (entre 0 et 100)
%-----------------------------------------
for i = 1:nbVilles
    for j = 1:2
        M(i,j) = 100 * rand;
    end
end

%-----------------------------------------
%   Génération d'une population initiale (permutations aléatoires de M)
%-----------------------------------------
for i = 1:popSize
    Po(i,:) = randperm(nbVilles);
end
