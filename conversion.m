function X = conversion(name)
    %convertit le fichier audio en matrice à l'aide de la TFCT

    [X,Fs] = audioread(name); % X = données | Fs = taux d'échantilonnage
    sound(X,Fs); %jouer l'audio
    [TFR,T,F]=tfrstft(X); % TFCT
    X = abs(TFR);
end