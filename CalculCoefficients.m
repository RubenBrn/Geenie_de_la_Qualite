%traitement jusqu'a P9 

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
masse_totale=242.86;
Valeur_cible=masse_totale/nb;


P1=[P1(1:6)
    P1(8:end)]; %on retire la valeur de la boulette 7, boulette de suivi 

%% stade P1
P = [P1];

S1= std(P1);
S1_lt = std(P) ;
IT(1) = 5*max([S1]);
[S(1) M(1) TS(1) TM(1) Cp(1) Cpk(1) Cpm(1)]=f_CalculCoeff_CT(P1, IT(1), Valeur_cible);

[Pp(1) Ppk(1) Ppm(1)]=f_CalculCoeff_LT(IT(1), TS(1), TM(1), S1_lt, M(1), Valeur_cible); 

%% stade P2
P = [P1 ; P2];

S2= std(P2);
S2_lt = std(P) ;
IT(2) = 5*max([S1 S2]);
[S(2) M(2) TS(2) TM(2) Cp(2) Cpk(2) Cpm(2)]=f_CalculCoeff_CT(P2, IT(2), Valeur_cible);

[Pp(2) Ppk(2) Ppm(2)]=f_CalculCoeff_LT(IT(2), TS(2), TM(2), S2_lt, M(2), Valeur_cible); 

%% stade P3
P = [P1 ; P2 ; P3];

S3= std(P3);
S3_lt = std(P) ;
IT(3) = 5*max([S1 S2 S3]);
[S(3) M(3) TS(3) TM(3) Cp(3) Cpk(3) Cpm(3)]=f_CalculCoeff_CT(P3, IT(3), Valeur_cible);

[Pp(3) Ppk(3) Ppm(3)]=f_CalculCoeff_LT(IT(3), TS(3), TM(3), S3_lt, M(3), Valeur_cible); 

%% stade P4
P = [P1 ; P2 ; P3 ; P4];

S4= std(P4);
S4_lt = std(P) ;
IT(4) = 5*max([S1 S2 S3 S4]);
[S(4) M(4) TS(4) TM(4) Cp(4) Cpk(4) Cpm(4)]=f_CalculCoeff_CT(P4, IT(4), Valeur_cible);

[Pp(4) Ppk(4) Ppm(4)]=f_CalculCoeff_LT(IT(4), TS(4), TM(4), S4_lt, M(4), Valeur_cible); 

%% stade P5
P = [P1 ; P2 ; P3 ; P4 ; P5];

S5= std(P5);
S5_lt = std(P) ;
IT(5) = 5*max([S1 S2 S3 S4 S5]);

[S(5) M(5) TS(5) TM(5) Cp(5) Cpk(5) Cpm(5)]=f_CalculCoeff_CT(P5, IT(5), Valeur_cible);

[Pp(5) Ppk(5) Ppm(5)]=f_CalculCoeff_LT(IT(5), TS(5), TM(5), S5_lt, M(5), Valeur_cible); 

%% stade P6
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6];

S6= std(P6);
S6_lt = std(P) ;
IT(6) = 5*max([S1 S2 S3 S4 S5 S6]);
[S(6) M(6) TS(6) TM(6) Cp(6) Cpk(6) Cpm(6)]=f_CalculCoeff_CT(P6, IT(6), Valeur_cible);

[Pp(6) Ppk(6) Ppm(6)]=f_CalculCoeff_LT(IT(6), TS(6), TM(6), S6_lt, M(6), Valeur_cible); 

%% stade P7
P = [P1 ; P2 ; P3 ; P4 ; P5];

S7= std(P7);
S7_lt = std(P) ;
IT(7) = 5*max([S1 S2 S3 S4 S5 S6 S7]);
[S(7) M(7) TS(7) TM(7) Cp(7) Cpk(7) Cpm(7)]=f_CalculCoeff_CT(P7, IT(7), Valeur_cible); 

[Pp(7) Ppk(7) Ppm(7)]=f_CalculCoeff_LT(IT(7), TS(7), TM(7), S7_lt, M(7), Valeur_cible); 

%% stade P8
P = [P1 ; P2 ; P3 ; P4 ; P5];

S8= std(P8);
S8_lt = std(P) ;
IT(8) = 5*max([S1 S2 S3 S4 S5 S6 S7 S8]);
[S(8) M(8) TS(8) TM(8) Cp(8) Cpk(8) Cpm(8)]=f_CalculCoeff_CT(P8, IT(8), Valeur_cible);


[Pp(8) Ppk(8) Ppm(8)]=f_CalculCoeff_LT(IT(8), TS(8), TM(8), S8_lt, M(8), Valeur_cible); 

%% stade P9
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6 ; P7 ; P8 ; P9];

S9= std(P9);
S9_lt = std(P) ;
IT(9) = 5*max([S1 S2 S3 S4 S5 S6 S7 S8 S9 ]);

[S(9) M(9) TS(9) TM(9) Cp(9) Cpk(9) Cpm(9)]=f_CalculCoeff_CT(P9, IT(9), Valeur_cible);


[Pp(9) Ppk(9) Ppm(9)]=f_CalculCoeff_LT(IT(9), TS(9), TM(9), S9_lt, M(9), Valeur_cible); 



%% Traitement global 



%Matrice finale 
Donnees=[Cp(1) Cpk(1) Cpm(1) Pp(1) Ppk(1) Ppm(1);
    Cp(2) Cpk(2) Cpm(2) Pp(2) Ppk(2) Ppm(2);
    Cp(3) Cpk(3) Cpm(3) Pp(3) Ppk(3) Ppm(3);
    Cp(4) Cpk(4) Cpm(4) Pp(4) Ppk(4) Ppm(4);
    Cp(5) Cpk(5) Cpm(5) Pp(5) Ppk(5) Ppm(5);
    Cp(6) Cpk(6) Cpm(6) Pp(6) Ppk(6) Ppm(6);
    Cp(7) Cpk(7) Cpm(7) Pp(7) Ppk(7) Ppm(7);
    Cp(8) Cpk(8) Cpm(8) Pp(8) Ppk(8) Ppm(8);
    Cp(9) Cpk(9) Cpm(9) Pp(9) Ppk(9) Ppm(9)];
%pour nous, voir si on cheat pas trop 



Ptraitement = [P1  P2  P3  P4  P5  P6  P7 P8  P9];
for i=1:9
    masse_production(i)= sum(Ptraitement(:,i));
    jbtest(Ptraitement(:,i))
end 

figure(1)
boxplot(Ptraitement)
title('Etudes statistiques des production') 
%% Carte de Controle 
%------------------------------------------------------------
%% Carte de Shainin

L=length(P1); 
figure (2) 
hold all 
xlim=[0 L];

title('Carte Shainin')

for i=1:9
    subplot(3,3,i) %x lignes, y colonnes
  
    ylim=[0 max(Ptraitement(:,i))];
    plot([1:L], Ptraitement(:,i), '+b', [0 L], [M(i)+IT(i) M(i)+IT(i)], '-r', [0 L], [M(i)-IT(i) M(i)-IT(i)], '-r',...
    [0 L],[M(i) M(i)], ':k', [0 L], [M(i)+IT(i)/2 M(i)+IT(i)/2], '-g', [0 L], [M(i)-IT(i)/2 M(i)-IT(i)/2],'-g');
    str={'Production' i};
    xlabel(str) 
end 

xlim=[0 L];

title('Carte Shainin')

for i=1:9
    subplot(3,3,i) %x lignes, y colonnes
  
    ylim=[0 max(Ptraitement(:,i))];
    plot([1:L], Ptraitement(:,i), '+b', [0 L], [M(i)+IT(i) M(i)+IT(i)], '-r', [0 L], [M(i)-IT(i) M(i)-IT(i)], '-r',...
     [0 L],[Valeur_cible Valeur_cible], ':r',[0 L], [M(i)+IT(i)/2 M(i)+IT(i)/2], '-g', [0 L], [M(i)-IT(i)/2 M(i)-IT(i)/2],'-g');
    
    str={'Production' i};
    xlabel(str) 
    mean(P(i))
end 

%Carte EWMA
n=5;  		% 5 valeurs 
L=3*sigma;    	% +- 3*sigma
La=0.2; 	% lambda =0.2
Mi(1)=Valeur_cible; 	% initialisation

% calcul des limites de contr?le (5 echantillons)
    LicMi=Valeur_cible-L*sigma*sqrt(La/(n*(2-La)));
    LscMi=Valeur_cible+L*sigma*sqrt(La/(n*(2-La)));
     Lics=-sigma;
    Lscs=1.964*sigma;
    
Mi(u+1)= La*mean(val(:,u))+(1-La)*Mi(u);  		% calcul des Mi
S(u)=std(val(:,u));                             % calcul ?cart type
