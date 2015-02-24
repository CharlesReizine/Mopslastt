classdef stringnamique <handle
    %Contains an empty matrix and the position of the last element we
    %filled
    properties
        liste_string;
        last_filled;
    end
  
    methods
        function self=stringnamique()
            self.liste_string=[{'test'}];
            self.liste_string=repmat(self.liste_string,1,60000);
            self.last_filled=0;
        end
        function ajoute(self,mot)
            taille=length(self.liste_string);
            self.last_filled=self.last_filled+1;
            if self.last_filled>taille
                self.liste_string=repmat(self.liste_string,1,2);
            end
            self.liste_string(self.last_filled)={mot};
        end
        function valid(self)
            self.liste_string=self.liste_string(1:self.last_filled);
        end
    end
    
end

