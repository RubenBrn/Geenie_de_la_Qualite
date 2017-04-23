function [Pp, Ppk, Ppm]=f_CalculCoeff_LT (IT, TS, TM, S_lt, Moy, Valeur_cible)

Pp = IT/(6*S_lt)  % 
Ppk = min((TS-Moy)/ (3*S_lt) , (Moy-TM)/ (3*S_lt))  % 
Ppm = IT / (6*( (S_lt^2 + (Moy-Valeur_cible)^2 ))^0.5)  % 


end 