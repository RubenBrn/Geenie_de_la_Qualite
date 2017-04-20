%traitement P5 
%production 1 amelioration masse - masse a vue d'oeil
clc 
clear all 
close all 

%% Valeurs expetimentales

load P1.m
load P2.m
load P3.m
load P4.m
load P5.m 
load P6.m
load P7.m
load P8.m
load P9.m

%dans les P sont stocke les valeurs de masses des diverses productions

nb=14;
masse_totale=142.4;
Valeur_cible=masse_totale/nb;


P1=[P1(1:6)
    P1(8:end)]; %on retire la valeur de la boulette 7, boulette de suivi 

%% stade P1
P = [P1];

S1_lt = std(P) ;
S1 = std(P1); 
M1 = mean(P1);
IT = 5*max(S1); 
TS = Valeur_cible+(IT/2) ;
TM = Valeur_cible -(IT/2) ;

Pp1 = IT/(6*S1_lt)  % 
Ppk1 = min((TS-M1)/ (3*S1_lt) , (M1-TM)/ (3*S1_lt))  % 
Ppm1 = IT / (6*( (S1_lt^2 + (M1-Valeur_cible)^2 ))^0.5)  % 
Cpk1 = (TS-M1)/ (3*S1)  % 
Cp1 = IT/ (6*S1) %  

Cpm1 = IT / (6*( (S1^2 + (M1-Valeur_cible)^2 ))^0.5)  %

%% stade P2
P = [P1 ; P2];

S2_lt = std(P) ;
S2 = std(P2); 
M2 = mean(P2);
IT2 = 5*max(S1, S2); 
TS = Valeur_cible+(IT2/2) ;
TM = Valeur_cible -(IT2/2) ;

Pp2 = IT2/(6*S2_lt)  % 
Ppk2 = min((TS-M2)/ (3*S2_lt) , (M2-TM)/ (3*S2_lt))  % 
Ppm2 = IT2 / (6*( (S2_lt^2 + (M2-Valeur_cible)^2 ))^0.5)  % 
Cpk2 = (TS-M2)/ (3*S2)  % 
Cp2 = IT2/ (6*S2) %  

Cpm2 = IT2 / (6*( (S2^2 + (M2-Valeur_cible)^2 ))^0.5)  %

%% stade P3
P = [P1 ; P2 ; P3];

S3_lt = std(P) ;
S3 = std(P3); 
M3 = mean(P3);
IT3 = 5*max([S1 S2 S3]);  
TS = Valeur_cible+(IT3/2) ;
TM = Valeur_cible -(IT3/2) ;

Pp3 = IT3/(6*S3_lt)  % 
Ppk3 = min((TS-M3)/ (3*S3_lt) , (M3-TM)/ (3*S3_lt))  % 
Ppm3 = IT3 / (6*( (S3_lt^2 + (M3-Valeur_cible)^2 ))^0.5)  % 
Cpk3 = (TS-M3)/ (3*S3)  % 
Cp3 = IT3/ (6*S3) %  

Cpm3 = IT3 / (6*( (S3^2 + (M3-Valeur_cible)^2 ))^0.5)  %

%% stade P4
P = [P1 ; P2 ; P3 ; P4];

S4_lt = std(P) ;
S4 = std(P4); 
M4 = mean(P4);
IT4 = 5*max([S1 S2 S3 S4]); 
TS = Valeur_cible+(IT4/2) ;
TM = Valeur_cible -(IT4/2) ;

Pp4 = IT4/(6*S4_lt)  % 
Ppk4 = min((TS-M4)/ (3*S4_lt) , (M4-TM)/ (3*S4_lt))  % 
Ppm4 = IT4 / (6*( (S4_lt^2 + (M4-Valeur_cible)^2 ))^0.5)  % 
Cpk4 = (TS-M4)/ (3*S4)  % 
Cp4 = IT4/ (6*S4) %  

Cpm4 = IT4 / (6*( (S4^2 + (M4-Valeur_cible)^2 ))^0.5)  %

%% stade P5
P = [P1 ; P2 ; P3 ; P4 ; P5];

S5_lt = std(P) ;
S5 = std(P5); 
M5 = mean(P5);
IT5 = 5*max([S1 S2 S3 S4 S5]); 
TS = Valeur_cible+(IT5/2) ;
TM = Valeur_cible -(IT5/2) ;

Pp5 = IT5/(6*S5_lt)  % 
Ppk5 = min((TS-M5)/ (3*S5_lt) , (M5-TM)/ (3*S5_lt))  % 
Ppm5 = IT5 / (6*( (S5_lt^2 + (M5-Valeur_cible)^2 ))^0.5)  % 
Cpk5 = (TS-M5)/ (3*S5)  % 
Cp5 = IT5/ (6*S5) %  

Cpm5 = IT5 / (6*( (S5^2 + (M5-Valeur_cible)^2 ))^0.5)  %
