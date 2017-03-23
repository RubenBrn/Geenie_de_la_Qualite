clc
clear all 
close all 

%X1 Hugo
X1 = [18.4	18.37	18
11.6	11.64	12
23.3	23.24	23
21.5	21.49	21
20.5	20.42	20
14.4	14.35	15
10.4	10.39	10
17.7	17.67	18
11.9	11.92	12
15.8	15.83	16
21.9	21.9	22
11.1	11.1	11
17.3	17.25	17
20.3	20.32	20
17.3	17.27	17]; 

S1=std(X1); 
M1=mean(X1);

M1>3*S1; %test repetabilite
%okay

%X2 Ruben

X2=[18.4	18.38	18
11.7	11.65	12
23.2	23.25	23
21.6	21.51	22
20.4	20.41	20
14.4	14.35	14
10.4	10.39	10
17.7	17.68	18
11.9	11.92	12
15.8	15.84	16
21.9	21.9	22
11.1	11.11	11
17.3	17.26	17
20.3	20.32	20
17.3	17.28	17];

M2=mean(X2);
S2=std(X2);
M2>3*S2; %test repetabilite
%okay

%% Methode R&R

Ecart = [0      -0.01	0
        -0.1    -0.01	0
        0.1     -0.01	0
        -0.1    -0.02	-1
        0.1     0.01	0
        0       0       1
        0       0	0
        0       -0.01	0
        0       0	0
        0       -0.01	0
        0       0	0
        0       -0.01	0
        0       -0.01	0
        0       0	0
        0       -0.01	0]; 

Moy_ecart=mean(abs(Ecart));

% Coeff * R  pour voir la validite des mesures 
% Coeff pour 2 op?rateur D4=3.27
Val_mesures = 3.27*Moy_ecart; %si Validite_mesures>Ecart --> pas valide

%pour trouver les valeurs non valides
L=length(Ecart(:,1));
C=length(Ecart(1,:));
for j=1:C
    for i=1:L
        if abs(Ecart(i,j))>Val_mesures(j)
            indices=[i j];
            disp(indices)
            
        end
    end 
end 

%Points aberrants pour les boulettes 4 et 6 sur la balance 3

%Matrice sans point aberrant 
Ecart_1=[Ecart(1,1) ; Ecart(6:end,1)]; 
Ecart_2=Ecart(:,2); 
Ecart_3=[Ecart(1:3,3)
        Ecart(5,3)
        Ecart(7:end,3)]; 

sigma_instr_1=mean(Ecart_1)/1.15; %coefficient d a revoir 
sigma_instr_2=mean(Ecart_2)/1.15;
sigma_instr_3=mean(Ecart_3)/1.153;

sigma_instr=[sigma_instr_1 sigma_instr_2 sigma_instr_3];

%% calcul de Cpc
%sigma_new=sigma(
Cpc=(3*S2)./(6.*sigma_instr);
