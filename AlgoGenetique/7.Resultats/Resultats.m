%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Resultats
%
%       Permet l'affichage des résultats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Resultats(nbVilles, meilleurChemin, M, G, distance)

disp(['G = ' num2str(G) ' // Distance = ' num2str(distance)]);
nbVillesCycle = nbVilles + 1;

%Params figure
figure(1);
%figure('rend','painters','pos',[450 10 800 600])

%-----------------------------------------
%   Tracage du chemin
%-----------------------------------------
for j = 1:nbVillesCycle

    if (j < nbVillesCycle)
        x = [M(meilleurChemin(j+1),1) M(meilleurChemin(j),1)];
        y = [M(meilleurChemin(j+1),2) M(meilleurChemin(j),2)];
        plot(x, y, 'b','LineWidth',1.2);
        legend(num2str(distance));
        hold on
    end
end

%-----------------------------------------
%   Coordonnées des villes visitées (1ère en rouge)
%-----------------------------------------
scatter(M(:,1),M(:,2), 'filled', 'b');
s1 = scatter(M(meilleurChemin(1),1),M(meilleurChemin(1),2), 'd','filled', 'r');
legend(s1, '1ère ville visitée', 'Location','southoutside');

%-----------------------------------------
%   Legende des villes
%-----------------------------------------
villes = [1:nbVilles]';
legendes = strcat('Ville ',num2str(villes));
legende = cellstr(legendes);
dx = 1;
dy = 1;
text(M(:,1)+dx,M(:,2)+dy,legende);

hold on

%-----------------------------------------
%   Legende du graphe
%-----------------------------------------
title(strcat('Meilleur cycle de hamilton : ', num2str(meilleurChemin)));
xlabel('Coordonnées x');
ylabel('Coordonnées y');
hold off
pause(0.01);