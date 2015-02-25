function [Grande_matrice,Liste_image,Quantite_descripteurs_image]=database_creator()
%Pour le moment, on concat�ne tout, il serait plus intelligent de doubler
%les matrices d�s qu'on atteint le bout, ( complexit� en log)
Dossier=uigetdir;
liste = dir(Dossier);
Grande_matrice=dynadouble(128);
Liste_image=stringnamique();
Quantite_descripteurs_image=containers.Map();
for i=1:length(liste)
     disp(['Quantit� de fichiers trait�s : ' num2str(i)]);
    nom = liste(i).name;
    ext = ['/' nom];
    file = [Dossier ext];
    if strcmp(file(end-2:end),'jpg')
        Image=double(imread(file));
        descript=Image_descripts(Image);
        [h w]=size(descript);
        if w<50
           
           disp(['Attention : la photo suivante poss�de moins de 50 descripteurs : ' nom]);
        end
        if w>0
            Quantite_descripteurs_image(nom)=w;
            
        end
        %Allocation dynamique
        
        for i=1:w
            %Allocation dynamique
            descripteur=descript(:,i);
            Grande_matrice.ajoute(descripteur);
            Liste_image.ajoute(nom);
        end
 
    elseif strcmp(file(end-2:end),'peg')
        
        Image=double(imread(file));
        descript=Image_descripts(Image);
        [h w]=size(descript);
        
        if w<50
           
           disp(['Attention : la photo suivante poss�de moins de 50 descripteurs : ' nom]);
        end
        if w>0
            Quantite_descripteurs_image(nom)=w;
            
        end
        %Allocation dynamique
        for i=1:w
            %Allocation dynamique
            descripteur=descript(:,i);
            Grande_matrice.ajoute(descripteur);
            Liste_image.ajoute(nom);
        end
    elseif strcmp(file(end-2:end),'png')
        
        Image=double(imread(file));
        descript=Image_descripts(Image);
        [h w]=size(descript);
        if w<50
           
           disp(['Attention : la photo suivante poss�de moins de 50 descripteurs : ' nom]);
        end
        if w>0
            Quantite_descripteurs_image(nom)=w;
            
        end
        %Allocation dynamique
        for i=1:w
            %Allocation dynamique
            descripteur=descript(:,i);
            Grande_matrice.ajoute(descripteur);
            Liste_image.ajoute(nom);
        end
    elseif strcmp(file(end-2:end),'JPG')
        
        Image=double(imread(file));
        descript=Image_descripts(Image);
        [h w]=size(descript);
        if w<50
           
           disp(['Attention : la photo suivante poss�de moins de 50 descripteurs : ' nom]);
        end
        if w>0
            Quantite_descripteurs_image(nom)=w;
            
        end
        %Allocation dynamique
        for i=1:w
            %Allocation dynamique
            descripteur=descript(:,i);
            Grande_matrice.ajoute(descripteur);
            Liste_image.ajoute(nom);
        end
    end
    Liste_image.valid();
    Grande_matrice.valid();
end