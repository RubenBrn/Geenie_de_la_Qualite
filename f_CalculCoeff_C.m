function [C]=f_CalculCoeff_C(Mesures, IT, Valeur_cible)


Sigma = std(Mesures); 
Moy = mean(Mesures);
TS = Valeur_cible+(IT/2) ;
TM = Valeur_cible -(IT/2) ;


Cpk = (TS-Moy)/ (3*Sigma);  % 
Cp = IT/ (6*Sigma); %  
Cpm = IT / (6*( (Sigma^2 + (Moy-Valeur_cible)^2 ))^0.5) ; %

C=[Sigma Moy TS TM Cp Cpk Cpm];
end 