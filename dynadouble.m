classdef dynadouble <handle
    %Contains a matrix of doubles and the position of the last filled
    %element
    
    properties
        matrice_double;
        last_filled;
    end
  
    methods
        function self=dynadouble(dim_col)
            self.matrice_double=zeros(dim_col,60000);
            self.last_filled=0;
        end
        function ajoute(self,vect)
            taille=size(self.matrice_double);
            self.last_filled=self.last_filled+1;
            if self.last_filled>taille(2)
                self.matrice_double=repmat(self.matrice_double,1,2);
            end
            self.matrice_double(:,self.last_filled)=vect;
        end
        function valid(self)
            self.matrice_double=self.matrice_double(:,1:self.last_filled);
        end
    end
    
end

