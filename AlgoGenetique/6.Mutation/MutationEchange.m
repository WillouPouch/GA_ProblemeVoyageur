%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Mutation d’échange
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Mutants = MutationEchange(GAParameters,ProblemParameters,Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(Enfants,1);
nbVilles = ProblemParameters.NbVilles;
pm = GAParameters.Pm;
Mutants = [];

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:popSize
   
    if(rand < pm) 

        locus = randperm(nbVilles,2);
        temp = Enfants(i,locus(2));
        Enfants(i,locus(2)) = Enfants(i,locus(1));
        Enfants(i,locus(1)) = temp;
    end
   
   Mutants = [Mutants;  Enfants(i,:)];
end
