%% exam Qualite 2016 - Ruben Brunetaud 

clc
clear all
close all 
%clf 

Mesure_Operateurs1 =[   4.0381    4.1130    4.0018    3.9962    4.1361    3.9592    3.9998    4.0736
                        4.0827    4.0233    3.9378    4.0453    3.8894    4.0196    4.0647    4.0170 
                        4.0739    4.0214    4.0513    4.0340    3.8948    3.9667    4.0980    3.9965 
                        4.0052    4.0480    3.8911    4.0278    3.9855    3.9248    3.9970    3.8483 ];
boxplot(Mesure_Operateurs1)
%--------------------------------------------------------------------------
%% question 1 :
IT= 1.2 ; 

%calcul du range moyen ? Recherche de l'etendu (max) pour chaque echantillon
for i=1:length(Mesure_Operateurs1(1,:))
    for j=1:4 %nombre d'operateur 
        Matrice_Ecart(i)=max(Mesure_Operateurs1(:,i)-min(Mesure_Operateurs1(:,i)));
        Delta(i)=abs(Matrice_Ecart(i)); 
    end 
end 
Range=mean(Delta); %valeur de l'etendue moyenne 

%Validite des mesures 
D4=2.28;
Val_mesures=D4*Range; 
%si Val_mesures>Ecart --> valide
%Ech : 1 2 3 4 5 6 7 8 
    %  ok pour tous 
    % Pas de point aberrants 
    
    
%d*4=2.082
sigma_mesure=Range/2.082;
Dispersion1=6*sigma_mesure; 

Cpc=IT/Dispersion1; 
% Cpc=3.18>3 Le processus de mesure est adapte pour les tolerances tres resserrees

%--------------------------------------------------------------------------
%% Question 2 :
Mesure_Operateurs2 =[   4.0381    4.1130    4.0018    3.9962    4.1361    3.9592    3.9998    4.0736    
                        4.0827    4.0233    3.9378    4.0453    3.8894    4.0196    4.0647    4.0170        
                        4.0739    4.0214    4.0513    4.0340    3.8948    3.9667    4.0980    3.9965                                
                        4.0052    4.0480    3.8911    4.0278    3.9855    3.9248    3.9970    3.8483        
                        4.0321    4.0076    4.0397    4.0866    4.0776    3.9545    4.0648    4.0139    
                        4.0518    3.9717    4.0037    3.9366    3.8760    4.0137    3.9950    4.0959    
                        3.9401    3.9251    3.8985    4.0398    4.2231    4.0582    3.9382    4.0669    
                        4.0574    3.9378    4.0253    4.1125    4.0321    4.0744    3.8715    4.0529   ];

anova2(Mesure_Operateurs2,2);

%On ne doit pas reordonner la matrice d'anova avant de lancer la commande ? 
% % Creation matrice anova
% 
% for j=1:4 %colonne j --> operateur(j) 
%         for i=1:8
%             Xanova(2*i-1,j)=Mesure_Operateurs2(j,i); %les lignes impaires sont la matrice des premieres manip
%             Xanova(2*i,j)=Mesure_Operateurs2(j+4,i); %les lignes paires sont la matrice des secondes manip
%  
%         end
% end 
% 
% [rep,tbl]=anova2(Xanova,2)

%pieces       0.01951    7   0.00279   0.56   0.7839
%operateurs    0.00963    3   0.00321   0.64   0.5932
%Interaction   0.13198   21   0.00628   1.26   0.2727
%residu         0.15982   32   0.00499                
%Total         0.32093   63    


a=7+1;
b=3+1;
n=64/(a*b);
MSR=0.00499; %residu
MSO=0.00321; %operateurs
MSOp=0.00628; % intercation
MSp=0.00279; %piece

sigma_repe=sqrt(MSR); 
sigma_operateurs=sqrt((MSO-MSOp)/(b*n));
sigma_piece=sqrt((MSp-MSOp)/(a*n));
sigma_int=sqrt((MSO-MSOp)/n); %interactions
sigma_repro=sqrt(sigma_operateurs^2+sigma_int^2); 
sigma_instru=sqrt(sigma_repro^2+sigma_repe^2);

Cpc_anova=IT/(6*sigma_instru);



%--------------------------------------------------------------------------
%% partie 2 :

Mesures_Run1=[3.4816 4.336 4.90 3.7033 3.8604 4.244 4.4604 3.5974 4.6003 3.344 3.8424 3.5786 3.3756 4.3774 4.2697 2.7659 4.5774 3.9328 4.159 3.7529 4.9326 4.1874 3.3475 3.9352 4.2011];
Mesures_Run2=[4.51 4.0436 4.1993 3.1416 3.6625 4.2278 3.3756 3.7812 3.6030 3.6990 3.7822 4.5843 4.3342 3.7414 4.1743 4.2954 4.4047 4.1170 4.1176 4.063 4.299 3.6802 4.6924 3.6990 4.0436];
Mesures_Run3= [4.5188 4.5672 3.788 4.2217 3.9125 3.9097 4.3017 4.0119 4.0462 3.8412 3.6232 4.1878 3.4011 4.4791 3.6603 4.3539 4.3391 3.5946 4.2780 3.7265 4.5399 4.5188 4.5672 3.788 4.2217];
Mesures_Run4=[3.9338 3.885 3.945 4.5037 4.596 3.9139 3.8268 3.909 4.1215 4.3068 4.503 4.1248 3.5925 4.081 3.7514 3.8406 4.4186 4.6212 3.4935 4.0957 4.0306 3.5325 4.6778 4.2328 3.945];


%% ---------------------question 1----------------------------------------
Mesures = [Mesures_Run1  Mesures_Run2  Mesures_Run3  Mesures_Run4];

jbtest(Mesures) 



Valeur_cible=4;
%calculs coeff courts-termes pour chaque serie
    C1=f_CalculCoeff_C (Mesures_Run1, IT, Valeur_cible); 
    C2=f_CalculCoeff_C(Mesures_Run2, IT, Valeur_cible);
    C3=f_CalculCoeff_C(Mesures_Run3, IT, Valeur_cible);
    C4=f_CalculCoeff_C(Mesures_Run4, IT, Valeur_cible);
%Les coeff sont les 3 dernieres valeurs de C    
Cp1=C1(end-2:end) ;   
Cp2=C2(end-2:end) ; 
Cp3=C3(end-2:end) ; 
Cp4=C4(end-2:end) ; 

%% ---------------------question 2 ----------------------------------------
%% ---------------------question 3 ----------------------------------------
%% ---------------------question 4 ----------------------------------------
Mesures = [Mesures_Run4  Mesures_Run3  Mesures_Run2  Mesures_Run1] ;

Echantillon = reshape(Mesures,5,20) ;

 % Carte de controle EWMA
l=length(Echantillon)
cible=mean(Mesures_Run4);
sigma=std(Mesures_Run4); %ecart type total
lambda = 0.2;   % D'apr?s les tables 
M(1) = cible; % Valeur de m0=cible
L=3;   % limites +/- 3 sigma
n=5;


for i = 2:length(Echantillon) %nombre de mesures
    M(i) = Echantillon(i-1)*lambda + (1-lambda)*M(i-1);
end

%Calcul de sigmaM(i)
for i = 1:length(Echantillon)
    sigmaM(i) = sigma * sqrt((lambda*(1-(1-lambda)^(2*i)))/(n*(2-lambda))) ;
end
 
 %Calculs des limites
 
 for i = 1:length(Echantillon)
     LSCM(i) = cible + L * sigmaM(i); %limite sup?rieure
 end
 
 for i = 1:length(Echantillon)
     LICM(i) = cible - L * sigmaM(i); %limite inf?rieure
 end
 
figure(4)
plot(1:l, M , 'r')
hold on
plot(1:l, LICM, '-b')
plot(1:l, LSCM, '-b')
hold off
title ('CARTE DE CONTROLE EWMA')

