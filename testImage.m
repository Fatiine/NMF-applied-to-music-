I = imread("lena.jpg")
Y=I(:,:,1);
Cb=I(:,:,2);
Cr=I(:,:,3);




[W,H] = NMFeucli(Y,2,0.1,50,0);
score(Y,W*H);





