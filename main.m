%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   TP3 - Métaheuristiques en optimisation
%
%   Esmé James - JAME15539504
%   Wilfried Pouchous - POUW04069501
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------
%	Clear
%-----------------------------------------
clc;

%-----------------------------------------
%   Choix utilisateurs
%-----------------------------------------
[ProblemParameters, UserInput, GAParameters] = GetUserInput();

%###########################################################################################################
% %--ATTENTION : PAS DE TEST SUR LES VALEURS ENTREES ICI
% ProblemParameters.NbVilles = 8;
% 
% GAParameters.PopSize = 10; %temp
% GAParameters.Gmax = 30; %temp
% GAParameters.Pc = 0.7; %temp
% GAParameters.Pm = 0.3; %temp
% 
% UserInput.Croisement = 2; %1 = Partiel, 2 = Par position, 3 = Par cycle
% UserInput.Mutation = 4; %1 = Echange, 2 = Insertion, 3 = Déplacement, 4 = Inversion
%###########################################################################################################


%-----------------------------------------
%   Ajout de chemins
%-----------------------------------------
addpath(genpath('Problemes'));
addpath(genpath('AlgoGenetique'));

%-----------------------------------------
%   Appel de l'algorithme génétique
%-----------------------------------------
GA(UserInput,ProblemParameters,GAParameters);

%-----------------------------------------
%   Suppression des chemins
%-----------------------------------------
rmpath('AlgoGenetique');