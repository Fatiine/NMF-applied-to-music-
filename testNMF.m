clear all; close all;

%définition de la matrice à approximer
X = [1 2 3 4 5 6 9 1; 4 1 1 4 1 1 3 5; 6 5 4 3 2 1 10 12; 1 1 1 2 2 1 1 1; 1 2 3 4 5 6 9 1;];

%% Utilisation de la norme euclidienne
%Initialisation aléatoire
[W_alea,H_alea] = NMFeucli(X,2,0.1,50,0);
Approximation_alea = W_alea*H_alea;
s_alea = score(X,Approximation_alea);

%Initialisation avec decomposition en valeurs singulières
[W_sing,H_sing] = NMFeucli(X,2,0.1,50,1);
Approximation_sing = W_sing*H_sing;
s_sing = score(X,Approximation_sing);

%% Utilisation de la divergence
%Initialisation aléatoire
[W2,H2] = NMFdiv(X,2,0.1,50);
Approximation2 = W2*H2
s2 = score(X,Approximation2);

%% méthode SAGE
[W_SAGE,H_SAGE] = SAGE(X,2,50);
Approximation_SAGE = W_SAGE*H_SAGE
s_SAGE = score(X,Approximation_SAGE);

%% Etude de l'influence de r
hold on
R=[0,0,0,0];
Seucli_alea=[0,0,0,0];
Seucli_sing=[0,0,0,0];
Sdiv=[0,0,0,0];
for r = 1: min(size(X)) - 1
    R(r)=r;
    [A0,B0] = NMFeucli(X,r,0.1,1000,0);
    Seucli_alea(r) = score(X,A0*B0);
    
    [A1,B1] = NMFeucli(X,r,0.1,1000,1);
    Seucli_sing(r)=score(X,A1*B1);
    
    [A2,B2] = NMFdiv(X,r,0.1,1000);
    Sdiv(r)=score(X,A2*B2);
    
    [A3,B3] = NMF_IS(X,r,0.1,10000);
    Sdiv2(r)=score(X,A3*B3); 
end

plot(R,Seucli_alea,'ro');
plot(R,Seucli_sing,'r*');
plot(R,Sdiv,'bx');
plot(R,Sdiv2,'go');
title('Représentation de l erreur en fonction du rang de factorisation')
xlabel('rang de factorisation');
ylabel('||X-W*H||fro');
legend('Utilisation de la norme euclidienne avec initialisation aléatoire','Utilisation de la norme euclidienne avec initialisation par décomposition en valeurs singulières','Utilisation de la divergence KL avec initialisation aléatoire','Utilisation de la divergence IS avec initialisation aléatoire')

hold off