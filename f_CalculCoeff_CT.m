function [Sigma, Moy, TS, TM, Cp, Cpk, Cpm]=f_CalculCoeff_CT(P, IT, Valeur_cible)


Sigma = std(P); 
Moy = mean(P);
TS = Valeur_cible+(IT/2) ;
TM = Valeur_cible -(IT/2) ;


Cpk = (TS-Moy)/ (3*Sigma);  % 
Cp = IT/ (6*Sigma); %  
Cpm = IT / (6*( (Sigma^2 + (Moy-Valeur_cible)^2 ))^0.5) ; %


end 