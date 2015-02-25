%load('Database.mat');%charge une base de données
%Data_base=Ensemble();

%database_creator(Data_base);

%save('Database.mat');%enregistre la base de données
[Grande_matrice,Liste_image,Quantite_descripteurs_image]=database_creator();
disp(['Data base crée']);
tree=Arbre();
taille=size(Grande_matrice.matrice_double);
taille=taille(2);
profondeur_max=floor(log10(taille/10));
disp(['On attaque la construction du tree']);
tree.Descripteurs_tree(Grande_matrice,Liste_image,0,profondeur_max);
disp(['On a terminé la construction du tree']);
%save('GrandArbre.mat','tree');%enregistre la base de données
%tree.supprime_feuille(200);
Irgb = double(imread('15.jpg'));
image_correspondante=tree.Trouve_image(Irgb,Quantite_descripteurs_image);%J'ai mis des accolades dans Construit_noeud
%sinon on met des cell dans des cell d'où les apostrophes quand on regarde
%le nom

%%%%%%%%
%Problème avec datas, il y a toujours 60000 éléments dans le stringnamique,
%pas de validation apparemment. Pourtant Liste_image est bon