function mahalanobis = distance_mahal(Y, echantillon)%echantillon = Grande_matrice
%Y is a vector, mahal distance is made for matrix, we adapt it here to fit
%vectors
mu = mean(echantillon);%moyenne empirique de l'échantillon
sigma = cov(echantillon);%covariance entre les données de l'échantillon
mahalanobis = (Y - mu)*inv(sigma)*(Y - mu)';%Attention la matrice sigma risque d'être singulière
end

