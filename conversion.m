function X = conversion(name)
    %convertit le fichier audio en matrice à l'aide de la TFCT

    [X,Fs] = audioread(name); % X = données | Fs = taux d'échantilonnage
    
    %Visualisations
    figure(1);
    plot(X);
    title('Visualisation des données audio de départ');
    xlabel('temps');
    ylabel('amplitude');
    
    figure(2);
    spectrogram(X);
    title('Spectrogramme des données audio de départ');
    
    %jouer l'audio
    sound(X,Fs);
    
    X = X(1:100:end,1:100:end); %echantillonnage
    [TFR,T,F]=tfrstft(X); % TFCT
    X = abs(TFR);
end