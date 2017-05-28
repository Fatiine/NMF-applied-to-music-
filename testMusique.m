%Etape 1 : acquérir la matrice à partir d'un fichier audio
X = conversion('données\audio.wav');

[W,H] = NMFeucli(X,2,0.1,50,0);
score(X,W*H);

figure()
plot(H(1,:))
title('Première ligne de H')
xlabel('temps')
ylabel('H(1,:)')

figure()
plot(H(2,:))
title('Deuxième ligne de H')
xlabel('temps')
ylabel('H(2,:)')

figure()
plot(W(:,1))
title('Première colonne de W')
xlabel('fréquence')
ylabel('W(:,1)')

figure()
plot(W(:,2))
title('Deuxième colonne de W')
xlabel('fréquence')
ylabel('W(:,2)')