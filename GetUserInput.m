%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Récupérer les données utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ProblemParameters, UserInput, GAParameters] = GetUserInput()

disp('Algorithme génétique');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Paramètres généraux
%-----------------------------------------
disp('I - Paramètres généraux du problème');
ProblemParameters.NbVilles = input('     Nombre de villes : ');
GAParameters.PopSize = input('     Taille de population : ');
GAParameters.Gmax = input('     Nombre de générations max (Gmax) : ');
GAParameters.Pc = input('     Probabilité de croisement Pc (entre 0 et 1) : ');
GAParameters.Pm = input('     Probabilité de mutation Pm (entre 0 et 1) : ');

%-----------------------------------------
%   Choix croisement
%-----------------------------------------
disp('II - Choix de la méthode de croisement');
UserInput.Croisement = input('     1 = Croisement partiel, 2 = Croisement par position, 3 = Croisement par cycle\n     Votre choix : ');
%Test validité
if (UserInput.Croisement ~= 1 && UserInput.Croisement ~= 2 && UserInput.Croisement ~= 3)
    disp('     Choix non valide -> Croisement 2 = Croisement par position choisi par défaut');
    UserInput.Croisement = 2;
end

%-----------------------------------------
%   Choix mutation
%-----------------------------------------
disp('III - Choix de la méthode de mutation');
UserInput.Mutation = input('     1 = Mutation échange, 2 = Mutation insertion, 3 = Mutation déplacement, 4 = Mutation déplacement\n     Votre choix : ');
%Test validité
if (UserInput.Mutation ~= 1 && UserInput.Mutation ~= 2 && UserInput.Mutation ~= 3 && UserInput.Mutation ~= 4)
    disp('     Choix non valide -> Mutation 1 = Mutation échange choisie par défaut');
    UserInput.Mutation = 1;
end

disp('IV - Lancement');
disp('------------------------------------------------------------');