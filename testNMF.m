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
for r = 1:7
    R(r)=r;
    [A,B] = NMFeucli(X,r,0.1,50);
    Seucli(r)=score(X,A*B);
    [A2,B2] = NMFdiv(X,r,0.1,50);
    Sdiv(r)=score(X,A2*B2);  
    [A3,B3] = NMF_IS(X,r,0.1,50);
    Sdiv2(r)=score(X,A3*B3);  
    
end
plot(R,Seucli,'ro');
plot(R,Sdiv,'bx');
plot(R,Sdiv2,'go');
title('Repr�sentation de l erreur en fonction du rang de factorisation')
xlabel('rang de factorisation');
ylabel('||X-W*H||fro');
legend('Utilisation de la norme euclidienne avec initialisation al�atoire','Utilisation de la divergence avec initialisation al�atoire')
hold off