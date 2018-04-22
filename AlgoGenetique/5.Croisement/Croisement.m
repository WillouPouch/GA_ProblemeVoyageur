%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de croisement
%
%       Génère des enfants des individus 
%       par le biais d'opérations de croisement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = Croisement(idCroisement, GAParameters, MP, ProblemParameters)

switch (idCroisement)
    case 1
        %croisement partiel
        Enfants = CroisementPartiel(GAParameters, MP, ProblemParameters.NbVilles);
    case 2
        %croisement par position
        Enfants = CroisementPosition(GAParameters, MP, ProblemParameters.NbVilles);
    case 3
        %croisement par cycle
        Enfants = CroisementCycle(GAParameters, MP, ProblemParameters.NbVilles);
end