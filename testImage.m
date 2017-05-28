I = imread('donn�es/lena.jpg');
%convertir en nuance de gris
I=get_luminance(I);
I = double(I);
%Afficher l'image de d�part
imagesc(I);
title('Image de d�part');
colormap(gray);

% D�composition
[W,H] = NMFeucli(I,100,0.1,10000,1);
score(I,W*H);

%Afficher les images r�sultats
figure(1)
imagesc(W);
title('W');
colormap(gray);

figure(2)
imagesc(H);
title('H');
colormap(gray);

figure(3)
imagesc(W*H);
title('W*H')
colormap(gray);


