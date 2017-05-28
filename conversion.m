function X = conversion(name)
    %convertit le fichier audio en matrice � l'aide de la TFCT

    [X,Fs] = audioread(name); % X = donn�es | Fs = taux d'�chantilonnage
    
    %Visualisations
    figure(1);
    plot(X);
    title('Visualisation des donn�es audio de d�part');
    xlabel('temps');
    ylabel('amplitude');
    
    figure(2);
    spectrogram(X);
    title('Spectrogramme des donn�es audio de d�part');
    
    %jouer l'audio
    sound(X,Fs);
    
    X = X(1:100:end,1:100:end); %echantillonnage
    [TFR,T,F]=tfrstft(X); % TFCT
    X = abs(TFR);
end