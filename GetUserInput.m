%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   R�cup�rer les donn�es utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ProblemParameters, UserInput, GAParameters] = GetUserInput()

disp('Algorithme g�n�tique');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Param�tres g�n�raux
%-----------------------------------------
disp('I - Param�tres g�n�raux du probl�me');
ProblemParameters.NbVilles = input('     Nombre de villes : ');
GAParameters.PopSize = input('     Taille de population : ');
GAParameters.Gmax = input('     Nombre de g�n�rations max (Gmax) : ');
GAParameters.Pc = input('     Probabilit� de croisement Pc (entre 0 et 1) : ');
GAParameters.Pm = input('     Probabilit� de mutation Pm (entre 0 et 1) : ');

%-----------------------------------------
%   Choix croisement
%-----------------------------------------
disp('II - Choix de la m�thode de croisement');
UserInput.Croisement = input('     1 = Croisement partiel, 2 = Croisement par position, 3 = Croisement par cycle\n     Votre choix : ');
%Test validit�
if (UserInput.Croisement ~= 1 && UserInput.Croisement ~= 2 && UserInput.Croisement ~= 3)
    disp('     Choix non valide -> Croisement 2 = Croisement par position choisi par d�faut');
    UserInput.Croisement = 2;
end

%-----------------------------------------
%   Choix mutation
%-----------------------------------------
disp('III - Choix de la m�thode de mutation');
UserInput.Mutation = input('     1 = Mutation �change, 2 = Mutation insertion, 3 = Mutation d�placement, 4 = Mutation d�placement\n     Votre choix : ');
%Test validit�
if (UserInput.Mutation ~= 1 && UserInput.Mutation ~= 2 && UserInput.Mutation ~= 3 && UserInput.Mutation ~= 4)
    disp('     Choix non valide -> Mutation 1 = Mutation �change choisie par d�faut');
    UserInput.Mutation = 1;
end

disp('IV - Lancement');
disp('------------------------------------------------------------');