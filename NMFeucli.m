function [W,H]=NMFeucli(X,r,eps,maxIteration,init)
    % The fonction retourne W et H tel que X~WH
    % r est le rang de factorisation
    % eps controle la qualité de l'approximation
    
    [n,m]=size(X);
    
    if init == 0
        % Initialisation aléatoire
        W0 = rand(n,r); %matrice aléatoire de taille (n x r)
        H0 = rand(r,m);
    end
    if init == 1
        % Initialisation par décomposition en valeurs singulières
        [U,S,V] = svd(X); %X=USV'
        W0 = U*sqrt(S);
        W0 = W0(:,1:r); %extraction pour avoir les bonnes dimensions. On garde les plus grandes valeurs singulières
        H0 = sqrt(S)*V';
        H0 = H0(1:r,:);
    end
    
    % Multiplicative update
    for iteration = 1 : maxIteration
        H = H0 .* ( (W0'*X) ./ ((W0'*W0)*H0) );
        W = W0 .* ( (X*H') ./ (W0*(H*H')) );
        W0 = W;
        H0 = H;
        
        if(norm(X-W*H)<eps) %norme euclidienne
            break;
        end

	end

end