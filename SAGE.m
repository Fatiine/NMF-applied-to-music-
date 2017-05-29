function [W,H] = SAGE(X,r,maxIteration)
    % V, W et H sont des matrices non n�gatives telles que X = WH
    % n et K limitent le nombre d'it�rations
    
    [n,m]=size(X);
    % Initialisation al�atoire
    W =rand(n,r); %matrice al�atoire de taille (n x r)
    H =rand(r,m);
    Xk = X;
    
    for i=1:1:maxIteration
        for k=1:1:r
            G = ( W(:,k)*H(k,:) ) ./ ( W*H ); %Wierner gain
            Xk = G.^2 * X + (1-G)*( W(:,k)*H(k,:) );
            % Mise � jour
            H(k,:) = (1/m) * (W(:,k)^(-1))' * Xk;
            H(k,:) = H(k,:) / sum(H(k,:)); %normalisation
            W(k,:) = (1/n) *  Xk * (H(k,:)^(-1))' ;
            W(k,:) = W(k,:) / sum(W(k,:)); %normalisation
        end
    end
end