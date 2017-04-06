%Carte attribut de masse 
%donnees 

n=14; 
nbdefaut_3=10;
nb_ech=1;
%porportion moyenne defectueux


%pour la prod P3 

np=nbdefaut_3/n; %10 nb defauts
prop_moy_np=np/n; 

sigma=sqrt(np*(1-prop_moy));

LSC=np+3*sigma; 
LIC=np-3*sigma; 

