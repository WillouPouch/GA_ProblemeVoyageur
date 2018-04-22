%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Algorithme g�n�tique
%      
%       Fait appel aux diff�rentes �tapes
%       de l'algorithme g�n�tique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = GA(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
Gmax = GAParameters.Gmax;
Generations = [];

%-----------------------------------------
%   Initialisation
%-----------------------------------------
[Po, M] = Initialisation(ProblemParameters.NbVilles, GAParameters.PopSize);
G = 1;

%-----------------------------------------
%   Redondance
%-----------------------------------------
Po = Redondance(Po, ProblemParameters.NbVilles, GAParameters.PopSize);

%-----------------------------------------
%   Evaluation de Po
%-----------------------------------------
P = Evaluation(ProblemParameters.NbVilles, Po, M);

%-----------------------------------------
% Boucle de g�n�ration des populations
%-----------------------------------------
while (G < Gmax)
    
    %-----------------------------------------
    %   S�lection RWS
    %-----------------------------------------
    MP = RWS(P, ProblemParameters.NbVilles);
    
    %-----------------------------------------
    %   Croisement
    %-----------------------------------------
    Enfants = Croisement(UserInput.Croisement, GAParameters, MP, ProblemParameters);
    
    %-----------------------------------------
    %   Mutation
    %-----------------------------------------
    Mutants = Mutation(UserInput.Mutation, GAParameters, ProblemParameters, Enfants);
    
    %-----------------------------------------
    %   Evaluation des mutants
    %-----------------------------------------
    Mutants = Evaluation(ProblemParameters.NbVilles, Mutants, M);

    %-----------------------------------------
    %   Meilleur chemin
    %-----------------------------------------
    [tempValue, index] = min(P(:,ProblemParameters.NbVilles+2));
    tempMeilleurChemin = P(index,1:ProblemParameters.NbVilles+1);
    
    if(G == 1)
        value = tempValue;
        meilleurChemin = tempMeilleurChemin;
    elseif(tempValue < value)
        value = tempValue;
        meilleurChemin = tempMeilleurChemin;
    end

    %-----------------------------------------
    %   R�sultats
    %-----------------------------------------
    Resultats(ProblemParameters.NbVilles, meilleurChemin, M, G, value);
    
    %-----------------------------------------
    %   Sauvegarde de la g�n�ration
    %-----------------------------------------
    Generations{G,1} = P;
    
    %G�n�ration suivante
    P = Mutants;
    G = G + 1;
end

%Sauvegarde de la g�n�ration dans un fichier
save('generation_data.mat','Generations');
Gmax = G;

%-----------------------------------------
%   R�sultats
%-----------------------------------------
Resultats(ProblemParameters.NbVilles, meilleurChemin, M, G, value);
