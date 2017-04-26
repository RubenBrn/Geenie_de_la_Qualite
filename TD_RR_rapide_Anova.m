clc
clear all
close all

%% Premi?re production

%X1 Hugo sur les 3 balances -
%Denver Instrument precise a 0.1g, Hanson precise a 1g et Traveler Ohrus precise a 0.01g
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

Xanova_Hugo=X1(:,2); %on reordonne selon l'operateur

S1=std(X1);
M1=mean(X1);

M1>3*S1; %test repetabilite
%okay

%X2 Ruben
%Denver Instrument pr?cise ? 0.1g, Hanson pr?cise ? 1g et Traveler Ohrus pr?cise ? 0.01g
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

Xanova_Ruben=X2(:,2);

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
% Coeff pour 2 operateurs D4=3.27
Valide_mesures = 3.27*Moy_ecart; %si Ecart >Validite_mesures --> mesure pas valide

%Boucle intelligente pour trouver les valeurs non valides
L=length(Ecart(:,1));
C=length(Ecart(1,:));
for j=1:C
    for i=1:L
        if abs(Ecart(i,j))>Valide_mesures(j)
            indices=[i j];
            disp(indices);

        end
    end
end

%{
Points aberrants :
Balance 1 - Mesures 2 ? 5
Balance 2 - Aucune
Balance 3 - Mesures 4 et 6
%}

%Matrices sans point aberrant
Ecart_1=[Ecart(1,1) ; Ecart(6:end,1)];
Ecart_2=Ecart(:,2);
Ecart_3=[Ecart(1:3,3)
        Ecart(5,3)
        Ecart(7:end,3)];

%sigma_instr_=nouveau Rmoy/(coeff selon le nouveau nb de pieces)

sigma_instr_1=mean(abs(Ecart_1))/1.157; %pour 11 pieces
sigma_instr_2=mean(abs(Ecart_2))/1.15; %pour 15 pieces
sigma_instr_3=mean(abs(Ecart_3))/1.153; %pour 13 pieces

sigma_instr=[sigma_instr_1 sigma_instr_2 sigma_instr_3];


%% calcul de Cpc
Cpc=(3*S2)./(6.*sigma_instr)


%% Methode ANOVA2

%premieres mesures --> seulement pour la bonne balance
Xanova1=[Xanova_Hugo Xanova_Ruben];

% Nouvelles mesures, faites a la fin de la seance du 16
    %Hugo %Ruben
Xanova2=[18.39	18.38
        11.65	11.65
        23.24	23.24
        21.51	21.50
        20.41	20.41
        14.35	14.35
        10.38	10.39
        17.67	17.67
        11.92	11.92
        15.82	15.82
        21.9	21.9
        11.11	11.10
        17.25	17.25
        20.32	20.32
        17.27	17.27] ;


%% Creation matrice anova

for j=1:2 %colonne 1 --> Hugo, colonne 2 --> Ruben
        for i=1:15
            Xanova(2*i-1,j)=Xanova1(i,j); %les lignes impaires sont la matrice des premieres manip
            Xanova(2*i,j)=Xanova2(i,j); %les lignes impaires sont la matrice des premieres manip
        end
end

[rep,tbl]=anova2(Xanova,2)

%{
Resultat de Anova2 :

Operateur         0       1    0.0001         2.13   0.1548
Piece          998.099   14   71.2928   1859812.38   0
Interaction     0       14    1.023e-05     0.27   0.9942
Error           0.001   30    3.83e-05
Total         998.101   59
%}

a=1+1; %nombre d'operateur
b=14+1; %nombre de pieces
n=59/(a*b);
MSR=3.83e-05; %residu
MSO=0.0001; %operateurs
MSOp=1.023e-5; % interaction
MSp=71.2928; %piece

sigma_repe=sqrt(MSR);
sigma_operateurs=sqrt((MSO-MSOp)/(b*n));
sigma_piece=sqrt((MSp-MSOp)/(a*n));
sigma_int=sqrt((MSO-MSOp)/n); %interactions
sigma_repro=sqrt(sigma_operateurs^2+sigma_int^2);
sigma_instru=sqrt(sigma_repro^2+sigma_repe^2);

IT=3*max([sigma_repe sigma_operateurs sigma_piece sigma_int sigma_repro sigma_instru]);

Cpc_anova=IT/(6*sigma_instru);
