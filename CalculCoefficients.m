%traitement jusqu'a P9

clc
clear all
close all

fsz=14; %taille des polices pour les traces


%% Valeurs experimentales

%dans les P sont stockes les valeurs de masses des diverses productions
%On retire a chaque fois la boulette de suivi (boulette gardee pour mesure a chaque production)
load P1.m
load P2.m
load P3.m
load P4.m
load P5.m
load P6.m
load P7.m
load P8.m
load P9.m


nb=14; %nombre d'echantillons dans chaque production
masse_totale=242.86; %calculee anterieurement
Valeur_cible=masse_totale/nb;


P1=[P1(1:6)
    P1(8:end)];
%on retire la valeur de la boulette 7, boulette de suivi

%% stade P1 -- Production au hasard (test balance)

%chaque production suit ce schema pour les calculs de coefficients
P = [P1];

S1= std(P1); %std production locale (court-terme)
S1_lt = std(P) ; %std long-terme
IT(1) = 6*S1; %6 fois le pire ecart type des productions suivant une amelioration majeure
[S(1) M(1) TS(1) TM(1) Cp(1) Cpk(1) Cpm(1)]=f_CalculCoeff_CT(P1, IT(1), Valeur_cible);
%les coefficients courts termes sont calcules dans cette fonction
[Pp(1) Ppk(1) Ppm(1)]=f_CalculCoeff_LT(IT(1), TS(1), TM(1), S1_lt, M(1), Valeur_cible);
%ici les coefficients long-terme

%% stade P2 --> Production sur le meme schema
P = [P1 ; P2];

S2= std(P2); %CT
S2_lt = std(P) ; %LT
IT(2) = 6*max([S1,S2]);
[S(2) M(2) TS(2) TM(2) Cp(2) Cpk(2) Cpm(2)]=f_CalculCoeff_CT(P2, IT(2), Valeur_cible);

[Pp(2) Ppk(2) Ppm(2)]=f_CalculCoeff_LT(IT(2), TS(2), TM(2), S2_lt, M(2), Valeur_cible);

%% stade P3 --> roulee sur table
P = [P1 ; P2 ; P3];

S3= std(P3);
S3_lt = std(P) ;
IT(3) = 6*max([S1,S2,S3]);
[S(3) M(3) TS(3) TM(3) Cp(3) Cpk(3) Cpm(3)]=f_CalculCoeff_CT(P3, IT(3), Valeur_cible);

[Pp(3) Ppk(3) Ppm(3)]=f_CalculCoeff_LT(IT(3), TS(3), TM(3), S3_lt, M(3), Valeur_cible);

%% stade P4 --> roulee sur la table tps precis (30s)
P = [P1 ; P2 ; P3 ; P4];

S4= std(P4);
S4_lt = std(P) ;
IT(4) = 6*max([S1,S2,S3,S4]);
[S(4) M(4) TS(4) TM(4) Cp(4) Cpk(4) Cpm(4)]=f_CalculCoeff_CT(P4, IT(4), Valeur_cible);

[Pp(4) Ppk(4) Ppm(4)]=f_CalculCoeff_LT(IT(4), TS(4), TM(4), S4_lt, M(4), Valeur_cible);

%% stade P5 --> Changement majeur de strategie
%Boule prise a vue d'oeil de la meme masse
P = [P1 ; P2 ; P3 ; P4 ; P5];

S5= std(P5);
S5_lt = std(P) ;
IT(5) = 6*max([S1, S2, S3, S4, S5]);

[S(5) M(5) TS(5) TM(5) Cp(5) Cpk(5) Cpm(5)]=f_CalculCoeff_CT(P5, IT(5), Valeur_cible);

[Pp(5) Ppk(5) Ppm(5)]=f_CalculCoeff_LT(IT(5), TS(5), TM(5), S5_lt, M(5), Valeur_cible);

%% stade P6 --> A vue d'oeil sur un cylindre
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6];

S6= std(P6);
S6_lt = std(P) ;
IT(6) = 6*max([S1, S2, S3, S4, S5, S6]);
[S(6) M(6) TS(6) TM(6) Cp(6) Cpk(6) Cpm(6)]=f_CalculCoeff_CT(P6, IT(6), Valeur_cible);

[Pp(6) Ppk(6) Ppm(6)]=f_CalculCoeff_LT(IT(6), TS(6), TM(6), S6_lt, M(6), Valeur_cible);

%% stade P7 --> Tout les 2cm sur un cylindre (a la main)
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6 ; P7];

S7= std(P7);
S7_lt = std(P) ;
IT(7) = 6*max([S1, S2, S3, S4, S5, S6, S7]);
[S(7) M(7) TS(7) TM(7) Cp(7) Cpk(7) Cpm(7)]=f_CalculCoeff_CT(P7, IT(7), Valeur_cible);

[Pp(7) Ppk(7) Ppm(7)]=f_CalculCoeff_LT(IT(7), TS(7), TM(7), S7_lt, M(7), Valeur_cible);

%% stade P8 -->  Tout les 2cm sur un cylindre (coupe avec un objet peu precis (piece))
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6 ; P7 ; P8 ];

S8= std(P8);
S8_lt = std(P) ;
IT(8) = 6*max([S1, S2, S3, S4, S5, S6, S7, S8]);
[S(8) M(8) TS(8) TM(8) Cp(8) Cpk(8) Cpm(8)]=f_CalculCoeff_CT(P8, IT(8), Valeur_cible);


[Pp(8) Ppk(8) Ppm(8)]=f_CalculCoeff_LT(IT(8), TS(8), TM(8), S8_lt, M(8), Valeur_cible);

%% stade P9 -->  Tout les 2cm sur un cylindre (coupe avec un objet precis (couteau))
P = [P1 ; P2 ; P3 ; P4 ; P5 ; P6 ; P7 ; P8 ; P9];

S9= std(P9);
S9_lt = std(P) ;
IT(9) = 6*max([S1, S2, S3, S4, S5, S6, S7, S8, S9]);

[S(9) M(9) TS(9) TM(9) Cp(9) Cpk(9) Cpm(9)]=f_CalculCoeff_CT(P9, IT(9), Valeur_cible);


[Pp(9) Ppk(9) Ppm(9)]=f_CalculCoeff_LT(IT(9), TS(9), TM(9), S9_lt, M(9), Valeur_cible);


% ------------------------------------------------------------------------------------------------------------
%% Traitement global

%Matrice finale des coefficients
Donnees=[Cp(1) Cpk(1) Cpm(1) Pp(1) Ppk(1) Ppm(1);
    Cp(2) Cpk(2) Cpm(2) Pp(2) Ppk(2) Ppm(2);
    Cp(3) Cpk(3) Cpm(3) Pp(3) Ppk(3) Ppm(3);
    Cp(4) Cpk(4) Cpm(4) Pp(4) Ppk(4) Ppm(4);
    Cp(5) Cpk(5) Cpm(5) Pp(5) Ppk(5) Ppm(5);
    Cp(6) Cpk(6) Cpm(6) Pp(6) Ppk(6) Ppm(6);
    Cp(7) Cpk(7) Cpm(7) Pp(7) Ppk(7) Ppm(7);
    Cp(8) Cpk(8) Cpm(8) Pp(8) Ppk(8) Ppm(8);
    Cp(9) Cpk(9) Cpm(9) Pp(9) Ppk(9) Ppm(9)];



%Matrice pour traiter les productions de maniere independante
Ptraitement = [P1  P2  P3  P4  P5  P6  P7 P8  P9];

for i=1:9
    masse_production(i)= sum(Ptraitement(:,i)); %pour voir les pertes de matieres ou les erreurs
    jb(i)=jbtest(Ptraitement(:,i)) %donne si la production suit bien une loi normale
    %Resultat jbtest==>
    %0     0     0     1     0     0     0     0     0
    
end

figure(1)
boxplot(Ptraitement) %juste pour voir
title('Etudes statistiques des productions')

%% Cartes de Controle
%------------------------------------------------------------
%Carte aux attributs

load Defauts.m

%valeur de sigma global de productions
sigma_max=std(P);

%Limites ? +-3 sigma
SM=+3*sigma_max;
Sm=-3*sigma_max;

%Nombre de productions
n=length(Defauts);

%Nombre moyen d?fectueux
npbarre=sum(Defauts)/14;

%porportion moyenne defectueux
pbarre=npbarre/n;

%Calcul de sigma defauts
sigma_defauts=sqrt(npbarre*(1-pbarre));

%Calcul des limites
LSC=npbarre+3*sigma_defauts;
LIC=max([0 npbarre-3*sigma_defauts]);
%On choisit de mettre la limite ?gale ? 0 si le LIC est n?gatif car la
%limite est n?cessairement positive

figure(7)
hold on
plot([1:n], Defauts,'-o', [0,n], [LSC LSC],'r', [0,n], [LIC LIC], 'r')
xlabel('Numero de la Production')
ylabel('Nombre de non-conformites')
title('Cartes aux attributs')
hold off

%% Carte de controle aux etendues glissantes
%{
l=length(Ptraitement(1,:));

for u=1:l
    %valeurs individuelles
        %rien a calculer

    %etendues glissantes
    R(u)=range([Ptraitement(:,u)]);

end
figure(9)
hold on
subplot(2,1,1)
plot([3:l], R(3:l));

subplot(2,1,2)
plot([3:l], Val(3:l));
%}
%% Carte de Shainin

%carte de controle pour l'operateur
L=length(P1);
figure (2)
hold all
xlim=[0 L];

title('Carte Shainin')

for i=1:9
    subplot(3,3,i) %x lignes, y colonnes

    ylim=[0. max(Ptraitement(:,i))];
    plot([1:L], Ptraitement(:,i), '+b', [0 L], [M(i)+IT(i) M(i)+IT(i)], '-r', [0 L], [M(i)-IT(i) M(i)-IT(i)], '-r',...
    [0 L],[M(i) M(i)], ':k', [0 L], [M(i)+IT(i)/2 M(i)+IT(i)/2], '-g', [0 L], [M(i)-IT(i)/2 M(i)-IT(i)/2],'-g');
    str={'Production' i};
    xlabel(str)
end



%% Carte EWMA

La=0.2; 	% lambda =0.2
%Carte EWMA par production, pas forcement utile pour notre ?tude, mais le code est la
%{
figure(4) %carte de controle EWMA par production
l=nb
for i=1:9
 subplot(3,3,i)
 sigma=S(i); %sigma global
 L=3*sigma;
 Lics=-sigma;
 Lscs=1.964*sigma;
    % initialisation
      Mi(1)=Valeur_cible;
      LicMi(1)=Valeur_cible-L*sigma*sqrt(La/(nb*(2-La)));
      LscMi(1)=Valeur_cible+L*sigma*sqrt(La/(nb*(2-La)));

    for u=1:14 %indice de la production
          Mi(u+1)= La*mean(Ptraitement(u,i))+(1-La)*Mi(u);  		% calcul des Mi
          %S(u)=std(Ptraitement(:,u));    % calcul ?cart type

          LicMi(u+1)=Valeur_cible-L*sigma*sqrt(La*(1-(1-La)^(2*u))/(nb*(2-La)));
          LscMi(u+1)=Valeur_cible+L*sigma*sqrt(La*(1-(1-La)^(2*u))/(nb*(2-La)));
    end
  hold on
  plot(1:l, Mi(2:end) , 'r', [0 l], [M(i) M(i)], '--k');
  plot(1:l, LscMi(2:end), '-b', 1:l, LicMi(2:end), '-b');

  str={'Production' i};
  xlabel(str)
  hold off
end
%}


%carte EWMA gloable
figure(5)

l=length(P);
%initialisation
sigma=std(P); %sigma global
L=3*sigma;
Lics=-sigma;
Lscs=1.964*sigma;
Mi(1)=Valeur_cible;

LicMi(1)=Valeur_cible-L*sigma*sqrt(La/(nb*(2-La)));
LscMi(1)=Valeur_cible+L*sigma*sqrt(La/(nb*(2-La)));

k=1; %curseur de texte
for u=1:l
      Mi(u+1)= La*(P(u))+(1-La)*Mi(u);  		% calcul des Mi


      LicMi(u+1)=Valeur_cible-L*sigma*sqrt(La*(1-(1-La)^(2*u))/(nb*(2-La)));
      LscMi(u+1)=Valeur_cible+L*sigma*sqrt(La*(1-(1-La)^(2*u))/(nb*(2-La)));

      if mod(u,14)==0 %a chaque nouvelle production on trace une ligne verticale
            line([u u], [10 25], 'color',[0.2 0.2 0.2],'LineStyle',':');

            str={'Prod',k};
            text(u-14, 12, str, 'Fontsize', fsz);
            k=k+1;

      end
end

hold on
plot(1:l, Mi(2:end), '-r')
plot(1:l, LscMi(2:end), '-b', 1:l, LicMi(2:end), '-b');
plot([0 l], [Valeur_cible, Valeur_cible], '--k')
title('Carte EWMA', 'Fontsize', fsz)
xlabel('Numero de la piece', 'Fontsize', fsz)
ylabel('EWMA', 'Fontsize', fsz)
hold off

%% Carte de Controle CUSUM

%Determination de k et h
%{
k : Le parametre de sensibilite k est une penalite imposee de facon a restreindre le nombre de fausses alertes.
Cette constante est fonction de l'importance de l'ecart que l'on souhaite detecter.
Plus k est petit, plus on decele de faibles derives mais plus on augmente le risque de fausses alertes.
h : le parametre h represente les limites de controles.
%}

% construction de la carte

nb=1; %valeur individuelle ici
sigma_X=sigma/(sqrt(nb));
h=5;			% limite
k=0.5;			% ecart a detecter = 1 sigma
H=h*sigma_X;		% limite
K=k*sigma_X;		% filtre

    SH(1)=0;  		% sommes initialisees ?? 0
    SL(1)=0;
k=1;
  figure(6)
  hold on
for u=1:l
	SH(u+1)=max([0, P(u)-(Valeur_cible+K)+SH(u)]) ; 	% calcul somme ??????haute????
	SL(u+1)=max([0, (Valeur_cible-K)-P(u)+SL(u)]) ;	% calcul  ???somme basse?e


    if mod(u,14)==0 %a chaque nouvelle production on trace une ligne verticale
        line([u u], [-25 40], 'color','k','LineStyle','--');

        str={'Prod',k}
            text(u-14, 33, str, 'Fontsize', fsz);
            k=k+1;
    end
end

UCL=H; %valeur sup
LCL=-H; %valeur inf


  plot(1:l, SH(2:end) , '-r', [0 l], [UCL UCL], ':k');
  plot(1:l, -SL(2:end), '-b', [0 l], [LCL LCL], ':k');

  title('Carte CuSum', 'Fontsize', fsz)
  xlabel('Numero de la piece', 'Fontsize', fsz)

hold off

%% Carte CuSum avec Masque en V

% construction de la carte

nb=1; %valeur individuelle ici
sigma_X=sigma/(sqrt(nb));
h=4;			% limite
k=0.5;			% ecart a detecter = 1 sigma
H=h*sigma_X;		% limite
K=k*sigma_X;		% filtre
p=k*sigma_X;   	% pente

L=2*h*sigma_X; 	% largeur de la base


    SH(1)=0;  		% sommes initialisees a 0
    SL(1)=0;
k=1;
  figure(6)
  hold on
  for u=1:l
      SH(u+1)=max([0, P(u)-(Valeur_cible+K)+SH(u)]) ;
      SL(u+1)=max([0, (Valeur_cible-K)-P(u)+SL(u)]) ;


      if mod(u,14)==0 %a chaque nouvelle production on trace une ligne verticale
          line([u u], [-25 40], 'color','k','LineStyle','--');

          str={'Prod',k}
          text(u-14, 33, str, 'Fontsize', fsz);
          k=k+1;

          % les limites sont fixees par le masque
          verticale(1) = SH(u+1)+L/2; 		% position haute de la largeur
          verticale(2)= SH(u+1)-L/2;

          c=SH(u+1)+p*(u+1)+L/2; 	%verticale 1	% calcul de l'ordonn?e en 0 droite haute du masque
          d=-p*(u+1)+SH(u+1)-L/2; %verticale 2	% droite basse

          %droiteH = -p.*x+c; 		% calcule de la droite sup?rieure - p* x + verticale (1)
          %droiteL = +p.*x+d;    		% calcule de la droite sup?rieure p* x + verticale (2)

          plot([0,u], [c,verticale(1)], 'Linewidth', 0.5, 'color', 'k')
          plot([0,u], [d,verticale(2)], 'Linewidth', 0.5, 'color', 'k')
          line([u,u], [u*p+d, -u*p+c], 'Linewidth', 0.5, 'color', 'k')

      end
  end



plot(1:l, SH(2:end) , '-r', [0 l], [UCL UCL], ':k');
plot(1:l, -SL(2:end), '-b', [0 l], [LCL LCL], ':k');

title('Carte CuSum', 'Fontsize', fsz)
xlabel('Numero de la piece', 'Fontsize', fsz)

hold off

%% Cusum aux etendues glissantes
figure(8)
hold on
nb=6; %moyenne sur 3 valeurs
sigma_X=sigma/(sqrt(nb));
h=4;			% limite
k=0.5;			% ecart a detecter = 1 sigma
H=h*sigma_X;		% limite
K=k*sigma_X;		% filtre
p=k*sigma_X;   	% pente

L=2*h*sigma_X; 	% largeur de la base


    SH(1)=0;  		% sommes initialisees a 0
    SL(1)=0;
k=1;
  for u=6:l

      Pglissante=mean([P(u-5),P(u-4),P(u-3),P(u-2),P(u-1),P(u)]);
      SH(u+1)=max([0, Pglissante-(Valeur_cible+K)+SH(u)]) ;
      SL(u+1)=max([0, (Valeur_cible-K)-Pglissante+SL(u)]) ;


%       if mod(u,14)==0 %a chaque nouvelle production on trace une ligne verticale
%           line([u u], [-25 40], 'color','k','LineStyle','--');
%
%           str={'Prod',k}
%           text(u-14, 33, str, 'Fontsize', fsz);
%           k=k+1;

%           % les limites sont fixees par le masque
%           verticale(1) = SH(u+1)+L/2; 		% position haute de la largeur
%           verticale(2)= SH(u+1)-L/2;
%
%           c=SH(u+1)+p*(u+1)+L/2; 	%verticale 1	% calcul de l'ordonn?e en 0 droite haute du masque
%           d=-p*(u+1)+SH(u+1)-L/2; %verticale 2	% droite basse
%
%           %droiteH = -p.*x+c; 		% calcule de la droite sup?rieure - p* x + verticale (1)
%           %droiteL = +p.*x+d;    		% calcule de la droite sup?rieure p* x + verticale (2)
%
%           plot([0,u], [c,verticale(1)], 'Linewidth', 0.5, 'color', 'k')
%           plot([0,u], [d,verticale(2)], 'Linewidth', 0.5, 'color', 'k')
%           line([u,u], [u*p+d, -u*p+c], 'Linewidth', 0.5, 'color', 'k')
%           end
end

UCL=H; %valeur sup
LCL=-H; %valeur inf


plot(1:l, SH(2:end) , '-r', [0 l], [UCL UCL], ':k');
plot(1:l, -SL(2:end), '-b', [0 l], [LCL LCL], ':k');

title('Carte CuSum au valeur glissante', 'Fontsize', fsz)
xlabel('Numero de la piece', 'Fontsize', fsz)
hold off
