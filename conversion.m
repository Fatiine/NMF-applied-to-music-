function X = conversion(name)
    % reads data from the file (.wav !)
    % returns sampled data, X and plays the sound
    % Fs is a sample rate for that data
    [X,Fs] = audioread(name);
    sound(X,Fs);
end