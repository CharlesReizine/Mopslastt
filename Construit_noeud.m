function [centroids,sous_matrice,Liste_images_finales]  = Construit_noeud(Grande_matrice,Liste_images_initiales) 
[h,w]=size(Grande_matrice.matrice_double);
%liste_images_initiales est un tableau ( 1,n) où n est le nbre d'élement du
%noeud
%Les dimensions de Grande_matrice sont 128*N 
m=min(w,10);  % si il y a moins de 10 descripteurs dans l'ensemble.
[Repartition,centroids]=kmeans2(double((Grande_matrice.matrice_double)'),m); % on répartit en m sous ensembles.
centroids=centroids';
sous_matrice=cell(m,1);
Liste_images_finales=cell(m,1);



for i=1:w % on parcourt la liste des repartitions
    position=Repartition(i); % position est donc le cluster correspondant au ième vecteur de la matrice initiale
    if size(sous_matrice{position})==0
        sous_matrice{position}=dynadouble(128);
        sous_matrice{position}.ajoute(Grande_matrice.matrice_double(:,i));
        
        %sous_matrice{position}= Grande_matrice(:,i); % si il n'y a pas encore de descripteur dans cet ensemble
        Liste_images_finales{position}=stringnamique();
        Liste_images_finales{position}.ajoute(Liste_images_initiales.liste_string{i});%Si on met les parenthèses à la place
        %des accolades pour liste_string, on met une cell dans une cell, ce
        %qui rend le contenu illisible lors de la recherche
        
        %Liste_images_finales{position}=Liste_images_initiales(1,i);
    else
    %Allocation dynamique
    sous_matrice{position}.ajoute(Grande_matrice.matrice_double(:,i));
    Liste_images_finales{position}.ajoute(Liste_images_initiales.liste_string{i});
    
    %sous_matrice{position}(:,end+1)=Grande_matrice(:,i);
    %Liste_images_finales{position}(:,end+1)=Liste_images_initiales(1,i);
    end
end
for i=1:m
    sous_matrice{i}.valid();
    Liste_images_finales{position}.valid();
    taille=size(Liste_images_finales{position}.liste_string);
    if taille(2)==60000
        disp(['C est pas normal ici']);
    end
end
end

% il faudra crée une classe noeud contenant centroid et sous_matrice. 
% ici ce serait son constructeur, que l'on appelera dans descripteur_tree
