function X = conversion(name)
    %convertit le fichier audio en matrice � l'aide de la TFCT

    [X,Fs] = audioread(name); % X = donn�es | Fs = taux d'�chantilonnage
    sound(X,Fs); %jouer l'audio
    [TFR,T,F]=tfrstft(X); % TFCT
    X = abs(TFR);
end