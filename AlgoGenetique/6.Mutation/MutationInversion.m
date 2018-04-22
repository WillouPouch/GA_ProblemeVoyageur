%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Mutation d’inversion
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Mutants = MutationInversion(GAParameters,ProblemParameters,Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(Enfants,1);
nbVilles = ProblemParameters.NbVilles;
pm = GAParameters.Pm;
Mutants = Enfants;
segment = [];
tempMutant = [];

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:popSize
   
    saveEnfant = Enfants(i,:);
    
    %Mutation avec probabilité de mutation pm
    if(rand < pm)

        %Sélection d'un segment temporaire
        locus = randperm(nbVilles/2,1);
        tailleLocus = randperm(nbVilles/2,1);
        tempSegment = saveEnfant(locus:locus+tailleLocus-1);
        
        %Inversion du segment temporaire
        for j = size(tempSegment,2):-1:1
            segment = [segment tempSegment(j)];
        end
        
        %Nouvelle position du segment
        location = randperm(nbVilles,1);
        
        %Vérification que location soit bien en dehors du segment
        while (locus <= location && location <= (locus+tailleLocus-1))
            location = randperm(nbVilles,1);
        end
        
        %Construction du mutant
        saveEnfant(locus:locus+tailleLocus-1) = [];
        if location > locus+tailleLocus-1
            tempMutant = [saveEnfant(1:location-tailleLocus) segment saveEnfant(location-tailleLocus+1:end)];
        elseif location < locus
            tempMutant = [saveEnfant(1:location) segment saveEnfant(location+1:end)];
        end
     
        Mutants(i,:) = tempMutant;

        segment = [];
        tempMutant = [];
    end
end
