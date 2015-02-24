%load('Database.mat');%charge une base de données
%Data_base=Ensemble();

%database_creator(Data_base);

%save('Database.mat');%enregistre la base de données
[Grande_matrice,Liste_image]=database_creator();
tree=Arbre();
taille=size(Grande_matrice.matrice_double);
taille=taille(2);
profondeur_max=floor(log10(taille/100));
tree.Descripteurs_tree(Grande_matrice,Liste_image,0,profondeur_max);
save('GrandArbre.mat','tree');%enregistre la base de données
%tree.supprime_feuille(100);
Irgb = double(imread('15.jpg'));
image_correspondante=tree.Trouve_image(Irgb);%J'ai mis des accolades dans Construit_noeud
%sinon on met des cell dans des cell d'où les apostrophes quand on regarde
%le nom

%%%%%%%%
%Problème avec datas, il y a toujours 60000 éléments dans le stringnamique,
%pas de validation apparemment. Pourtant Liste_image est bon