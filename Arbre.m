classdef Arbre <handle
    properties
        Matrice_centroids;
        fils;
        nbre_fils;
        datas;
    end
    methods
        function self= Arbre()%Constructeur par défaut
            self.Matrice_centroids=NaN;
            %self.fils=cell(min(taille,10),1)
            %self.nbre_fils=min(taille,10);
            self.fils=NaN;
            self.nbre_fils=0;
            self.datas=NaN;
        end
        function Descripteurs_tree(self,Grande_matrice,Liste_images,profondeur,max_depth)
           
            [h taille]=size(Grande_matrice.matrice_double);
            
            if profondeur==max_depth  || taille<10
                
                self.datas=Liste_images;
                self.datas.valid();
                self.datas=self.datas.liste_string;
                
              
            else     
            
            
                [centroids,sous_matrice,Liste_images_finales]  = Construit_noeud(Grande_matrice,Liste_images);
                self.Matrice_centroids=centroids';
                [h,w]=size(centroids);
                self.nbre_fils=w;
                self.fils=cell(w,1);
                for i=1:w
                
                    
                    fils_tempo=Arbre();
                    fils_tempo.Descripteurs_tree(sous_matrice{i},Liste_images_finales{i},profondeur+1,max_depth);
                    self.fils{i}=fils_tempo;
                    
                end
            end
        end
        
        function datas=Trouve_feuille(self,descripteur)
            if self.nbre_fils==10
                bonne_branche=dsearchn(double(self.Matrice_centroids),double(descripteur'));
                Son=self.fils{bonne_branche};
                datas=Son.Trouve_feuille(descripteur);
            else
                datas=self.datas;
            end
        end
        function Liste_images_correspondantes=Trouve_image(self,image)
            descripteurs=Image_descripts(image);
            [h w]=size(descripteurs);
            Liste_images=containers.Map();
            Tableau_frequence=[];
            Tableau_correspondance=[];
            for i=1:w
                descript=descripteurs(:,i);
                donnees=self.Trouve_feuille(descript); % datas est un cell contenant le nom des listes des images de la feuille
                [taille1, taille2]=size(donnees); % on parcourt toute la feuille
                if taille1*taille2>1 % dans le cas où les données sont NaN, la feuille ne contient qu'un élément. (on perd les feuilles ne contenant qu'un descripteur)
                
                    for j=1:taille2 
                        %taille2
                       %j
                        nom_photo=donnees{j};
                        if Liste_images.isKey(nom_photo)
                            position=Liste_images(nom_photo);
                            Tableau_frequence(position)=Tableau_frequence(position)+1;
                        else
                            Tableau_frequence=[Tableau_frequence 1];%Concatenation
                            taille=size(Tableau_frequence);
                            taille=taille(2);
                            Liste_images(nom_photo)=taille;
                            Tableau_correspondance=[Tableau_correspondance {nom_photo}];%Concatenation
                        end
                    end
                end
                
            end
            
            [tri ordre]=sort(Tableau_frequence,'descend');
            ordre=ordre(1:5);
            
            Liste_images_correspondantes=Tableau_correspondance(ordre);
            
                

        end
         function supprime_feuille(self,seuil) % nous allons supprimer les feuilles possédant plus de seuils éléments
            if self.nbre_fils==0 % si on est sur une feuille
               taille=size(self.datas);
               taille=taille(2);
               if taille>seuil
                   self.datas=NaN;
               
                   taille
                   seuil
                else
               
               end
            else 
                for i=1:self.nbre_fils
                    interm=self.fils{i};
                    interm.supprime_feuille(seuil);
                    self.fils{i}=interm;
                end
                
            end 
        end       
       
        
                
    end
end