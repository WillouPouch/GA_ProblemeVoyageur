%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Croisement partiel
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = CroisementPartiel(GAParameters, MP, nbVilles)

%-----------------------------------------
%	Init variables
%-----------------------------------------
popSize = size(MP,1);
pc = GAParameters.Pc;
routePartielles = [];
Enfants = [];

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:popSize
    
    %Sélection des couples de parents 
    P1 = MP(i,:);
    if(i < popSize)
        P2 = MP(i+1,:);
    else
        P2 = MP(randperm(nbVilles,1),:); %Un parent aléatoire
    end
    
    %ETAPE 1 : On sélectionne deux emplacements aléatoires dans chaque parent
    perm = sort(randperm(nbVilles,2));

    %Crossover avec probabilité de croisement pc
    if(rand <= pc)
        
        %ETAPE 2 : On échange les segments formés par les deux endroits
        Enfant1 = [P1(1,1:perm(1)-1) P2(1,perm(1):perm(2)) P1(1,perm(2)+1:end)];
        Enfant2 = [P2(1,1:perm(1)-1) P1(1,perm(1):perm(2)) P2(1,perm(2)+1:end)];
        
        %ETAPE 3 : Création des routes partielles
        for j = perm(1):perm(2)
            if P1(1,j) ~= Enfant1(1,j)
                routePartielles = [routePartielles; P1(1,j) Enfant1(1,j)];
            end
        end
        %Arrangement des routes partielles (identiques, inverses,
        %multiples)
        for j = 1:size(routePartielles,1)
            k = 1;
            modifRP = false;
            while k ~= size(routePartielles,1)+1
                if(j == k)
                    k = k + 1;
                    continue;
                end
                
                for m = 1:2
                    test = find(routePartielles(k,:) == routePartielles(j,m));
                    if(test == 1)
                        routePartielles(j,m) = routePartielles(k,2);
                        routePartielles(k,:) = 0;
                        modifRP = true; %reparcourir l'ensemble des routes, indispensable!
                    elseif(test == 2)
                        routePartielles(j,m) = routePartielles(k,1);
                        routePartielles(k,:) = 0;
                        modifRP = true; %reparcourir l'ensemble des routes, indispensable!
                    end
                end
    
                %Si modifications d'une route, on reparcourt toutes les
                %autres routes
                if(modifRP)
                    k = 1;
                    modifRP = false;
                else
                    k = k + 1;
                end
            end
        end        
        
        %S'il existe des routes partielles
        if(~isempty(routePartielles))
            %Enlever les couples identiques (0-0, 1-1, ...)
            same = find(routePartielles(:,1) == routePartielles(:,2));
            routePartielles(same,:) = [];
   
            %ETAPE 4 : Correction des enfants (s'ils contiennent des doublons)
            if size(unique(Enfant1),2) < nbVilles      
                for k = 1:nbVilles
                    %On sort quand les enfants sont uniques
                    if((size(unique(Enfant1),2) == nbVilles) && (size(unique(Enfant2),2) == nbVilles))
                        break;
                    %Correction seulement en dehors du segment
                    elseif(~((perm(1)<=k) && (k<=perm(2))))
                        for m = 1:nbVilles
                            if(m == k)
                                continue;
                            end                        
                            %Correction Enfant 1
                            if(Enfant1(k) == Enfant1(m))
                                for n = 1:size(routePartielles,1)
                                    if(Enfant1(k) == routePartielles(n,1))
                                        Enfant1(k) = routePartielles(n,2);
                                        break;
                                    elseif(Enfant1(k) == routePartielles(n,2))
                                        Enfant1(k) = routePartielles(n,1);
                                        break;
                                    end
                                end
                            end
                            %Correction Enfant 2
                            if(Enfant2(k) == Enfant2(m))
                                for n = 1:size(routePartielles,1)
                                    if(Enfant2(k) == routePartielles(n,1))
                                        Enfant2(k) = routePartielles(n,2);
                                        break;
                                    elseif(Enfant2(k) == routePartielles(n,2))
                                        Enfant2(k) = routePartielles(n,1);
                                        break;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

    else
        Enfant1 = P1;
        Enfant2 = P2;
    end
    
    Enfants = [Enfants; Enfant1; Enfant2];
    Enfant1 = [];
    Enfant2 = [];
    routePartielles = [];
end
