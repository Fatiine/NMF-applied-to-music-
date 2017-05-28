%Etape 1 : acqu�rir la matrice � partir d'un fichier audio
X = conversion('donn�es\audio.wav');

[W,H] = NMFeucli(X,2,0.1,50,0);
score(X,W*H);

figure()
plot(H(1,:))
title('Premi�re ligne de H')
xlabel('temps')
ylabel('H(1,:)')

figure()
plot(H(2,:))
title('Deuxi�me ligne de H')
xlabel('temps')
ylabel('H(2,:)')

figure()
plot(W(:,1))
title('Premi�re colonne de W')
xlabel('fr�quence')
ylabel('W(:,1)')

figure()
plot(W(:,2))
title('Deuxi�me colonne de W')
xlabel('fr�quence')
ylabel('W(:,2)')