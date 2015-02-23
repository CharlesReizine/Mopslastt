function [centroids,sous_matrice]  = Construit_noeud(Grande_matrice) 
[h,w]=size(Grande_matrice);
%Les dimensions de Grande_matrice sont 128*N 
m=min(w,10);  % si il y a moins de 10 descripteurs dans l'ensemble.
[Repartition,centroids]=kmeans(double(Grande_matrice'),m); % on répartit en m sous ensembles.
centroids=centroids';
sous_matrice=cell(m,1);



for i=1:w % on parcourt la liste des repartitions
    position=Repartition(i); % position est donc le cluster correspondant au ième vecteur de la matrice initiale
    if size(sous_matrice{position})==0
        sous_matrice{position}= Grande_matrice(:,i); % si il n'y a pas encore de descripteur dans cet ensemble
    else
    
    sous_matrice{position}=[sous_matrice{position}(:,:) Grande_matrice(:,i)]; % sinon on concatène
    end
end
end

% il faudra crée une classe noeud contenant centroid et sous_matrice. 
% ici ce serait son constructeur, que l'on appelera dans descripteur_tree
