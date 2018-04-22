%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de mutation
%
%       Génère des mutants 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = Mutation(idMutation, GAParameters, ProblemParameters, Enfants)

switch (idMutation)
    case 1
        %mutation d’échange
        Mutants = MutationEchange(GAParameters, ProblemParameters, Enfants);
    case 2
        %mutation d’insertion
        Mutants = MutationInsertion(GAParameters, ProblemParameters, Enfants);
    case 3
        %mutation de déplacement
        Mutants = MutationDeplacement(GAParameters, ProblemParameters, Enfants);
    case 4
        %mutation d’inversion 
        Mutants = MutationInversion(GAParameters, ProblemParameters, Enfants);
end
