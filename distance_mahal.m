function mahalanobis = distance_mahal(Y, echantillon)%echantillon = Grande_matrice
%Y is a vector, mahal distance is made for matrix, we adapt it here to fit
%vectors
mu = mean(echantillon);%moyenne empirique de l'�chantillon
sigma = cov(echantillon);%covariance entre les donn�es de l'�chantillon
mahalanobis = (Y - mu)*inv(sigma)*(Y - mu)';%Attention la matrice sigma risque d'�tre singuli�re
end

