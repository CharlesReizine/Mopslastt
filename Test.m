%load('Database.mat');%charge une base de donn�es
%Data_base=Ensemble();

%database_creator(Data_base);

%save('Database.mat');%enregistre la base de donn�es
A=Ensemble();
Irgb = double(imread('images/3.jpg'));
A.Ajoute_image_DB(Irgb);
Irgb = double(imread('images/6.jpg'));
A.Ajoute_image_DB(Irgb);
tree=Arbre(10);
tree.Descripteurs_tree(A.Matrice_de_reference,0);

Descript=Image_descripts(Irgb);
descripteur=Descript(:,1);
Liste_position=tree.Recherche_descripteurs(descripteur);
