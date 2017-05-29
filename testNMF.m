%d�finition de la matrice � approximer
X = [1 2 3 4 5 6 9 1; 4 1 1 4 1 1 3 5; 6 5 4 3 2 1 10 12; 1 1 1 2 2 1 1 1; 1 2 3 4 5 6 9 1;];

%% Utilisation de la norme euclidienne
%Initialisation al�atoire
[W,H] = NMFeucli(X,2,0.1,50);
Approximation = W*H;
s = score(X,Approximation);

%% Utilisation de la divergence
%Initialisation al�atoire
[W2,H2] = NMFdiv(X,2,0.1,50);
Approximation2 = W2*H2
s2 = score(X,Approximation2);

%% Etude de l'influence de r
hold on
R=[0,0,0,0,0,0,0];
Seucli=[0,0,0,0,0,0,0];
Sdiv=[0,0,0,0,0,0,0];
Seucli_ring=[0,0,0,0,0,0,0];
for r = 1:7
    R(r)=r;
    [A,B] = NMFeucli(X,r,0.1,1000);
    Seucli(r)=score(X,A*B);
    [A1,B1] = NMFeucli(X,r,0.1,1000,1);
    Seucli_sing(r)=score(X,A1*B1);
    [A2,B2] = NMFdiv(X,r,0.1,1000);
    Sdiv(r)=Div(X,A2*B2);  
    [A3,B3] = NMF_IS(X,r,0.1,1000);
    Sdiv2(r)=Div2(X,A3*B3);  

end
plot(Seucli,'r');
plot(Seucli_sing,'k')
plot(Sdiv,'b');
plot(Sdiv2,'g');

title('Repr�sentation de l erreur en fonction du rang de factorisation')
xlabel('rang de factorisation');
ylabel('||X-W*H||fro');
legend('Utilisation de la norme euclidienne avec initialisation aléatoire','Utilisation de la norme euclidienne avec initialisation par décomposition en valeurs singulières','Utilisation de la divergence KL avec initialisation aléatoire','Utilisation de la divergence IS avec initialisation aléatoire')
hold off