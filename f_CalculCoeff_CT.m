function [Sigma, Moy, TS, TM, Cp, Cpk, Cpm]=f_CalculCoeff_CT(P, IT, Valeur_cible)


Sigma = std(P);
Moy = mean(P);
TS = Valeur_cible+(IT/2) ; %valeur de tolerance max
TM = Valeur_cible -(IT/2) ; %valeur de tolerance min


Cpk = min([(TS-Moy)/ (3*Sigma), (Moy-TM)/ (3*Sigma)]);  % 
Cp = IT/ (6*Sigma); %
Cpm = IT / (6*( (Sigma^2 + (Moy-Valeur_cible)^2 ))^0.5) ; %


end
