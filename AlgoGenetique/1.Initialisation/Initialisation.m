%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   �tape d'initialisation
%
%       G�n�re des individus al�atoire
%       dans les limites du probl�me
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Po, M] = Initialisation(nbVilles, popSize)

%-----------------------------------------
%   G�n�ration de coordonn�es (x,y) de villes (entre 0 et 100)
%-----------------------------------------
for i = 1:nbVilles
    for j = 1:2
        M(i,j) = 100 * rand;
    end
end

%-----------------------------------------
%   G�n�ration d'une population initiale (permutations al�atoires de M)
%-----------------------------------------
for i = 1:popSize
    Po(i,:) = randperm(nbVilles);
end
