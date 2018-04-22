%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Mutation d’insertion
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = MutationInsertion(GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(Enfants,1);
nbVilles = ProblemParameters.NbVilles;
pm = GAParameters.Pm;
Mutants = Enfants;

%-----------------------------------------
%	Boucle de mutation
%-----------------------------------------
for i = 1:popSize
    %Mutation avec probabilité de mutation pm
    if(rand <= pm)
        %Etape 1 : choisir un locus au hasard et un endroit aléatoire
        locusAlea = Enfants(i,randperm(nbVilles,1));
        indiceAlea = randperm(nbVilles,1);

        %Etape 2 : prend l'enfant et enleve le locus
        decalage = Enfants(i,:);
        decalage(decalage == locusAlea) = [];
 
        %Etape 3 : reconstruit l'enfant en placant le locus à l'endroit
        %défini
        Mutants(i,:) = [decalage(1:indiceAlea-1) locusAlea decalage(indiceAlea:end)];
    end
end
