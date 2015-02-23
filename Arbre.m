classdef Arbre <handle
    properties
        Matrice_centroids;
        fils;
        nbre_fils;
    end
    methods
        function self= Arbre(taille)
            self.Matrice_centroids=NaN;
            self.fils=cell(min(taille,10),1);
            self.nbre_fils=min(taille,10);
        end
        function Descripteurs_tree(self,Grande_matrice,profondeur)
           
            if profondeur==5 || self.nbre_fils==1
                self.fils=Grande_matrice;
                self.nbre_fils=0;
            else     
            
            
                [centroids,sous_matrice]  = Construit_noeud(Grande_matrice);
                self.Matrice_centroids=centroids';
                
                [w,h]=size(centroids);
                for i=1:h
                
                    
                    fils_tempo=Arbre(h);
                    
                    fils_tempo.Descripteurs_tree(sous_matrice{i},profondeur+1);
                    self.fils{i}=fils_tempo;
                end
            end
        end
        
        function Liste_descripteurs=Recherche_descripteurs(self,descripteur)
            while self.nbre_fils>0
                truc=size(self.Matrice_centroids);
                
                bonne_branche=dsearchn(double(self.Matrice_centroids),double(descripteur'));
                Liste_descripteurs=self.fils{bonne_branche}.Recherche_descripteurs(descripteur);
                if truc>1
                    truc
                    bonne_branche
                self.nbre_fils
                end
                bonne_branche;
                self.nbre_fils;
            end
            Liste_descripteurs=self.fils;
                
        end
        function Liste_position=Recherche_image(self,image,matrice_de_reference)
            Matrice_descripteur = Image_descripts(image);
            [h w]=size(Matrice_descripteur);
            Liste_descripteurs=[];
            for i=1:w
                descripteur=Matrice_descripteur(:,i);
                petite_matrice=self.Recherche_descripteurs(descripteur);
                Liste_descripteurs=horzcat(Liste_descripteurs,petite_matrice);
                1
                
            end
            Liste_position=dsearchn(matrice_de_reference',Liste_descripteurs');
           
        end
        
                
    end
end