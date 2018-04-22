%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape de redondance
%
%       Vérifie les redondances d'une
%       population et les supprime
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = Redondance(Po, nbVilles, popSize)

%-----------------------------------------
%   init variables
%-----------------------------------------
redondances = [];
compteur = 0;

%-----------------------------------------
%   Vérification des redondances
%-----------------------------------------
for i = 1:popSize
    currentLine = Po(i,:);
 
    for j = 1:popSize
        if(i == j)
            continue;
        end
        
        indice = find(Po(j,:) == currentLine(1,1));
        
        %newLine = premiereVal + valPuivantes + valPrecedentes
        newLine = [ currentLine(1,1) Po(j, indice+1:end) Po(j, 1:indice-1) ];
 
        for k = 1:nbVilles
            if(currentLine(1,k) ~= newLine(1,k))
                break;
            else
                compteur = compteur+1;
            end
            
            if(compteur == nbVilles)
                redondances = [redondances ; i j];
            end
        end

        compteur = 0;
    end
end

%-----------------------------------------
%   Suppression des doublons d'indices dans les redondances
%-----------------------------------------
for i = 1:size(redondances,1)
    for j = 1:size(redondances,1)       
        if(i == j)
            continue;
        end
  
        if(redondances(i,1) == redondances(j,2))
            redondances(j, :) = [0 0];
        end
    end
end

%-----------------------------------------
%   Suppression des redondances
%-----------------------------------------
for i = 1:size(redondances,1)
    if(redondances(i,1) ~= 0)
        Po(redondances(i,1),:) = [];
    end
end