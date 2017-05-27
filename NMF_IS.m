function [W0,H0]=NMF_IS(X,r,eps,maxIteration)
    % The fonction retourne W et H tel que X~WH
    % r est le rang de factorisation
    % eps controle la qualit� de l'approximation
    
%% Initialisation
    [n,m]=size(X);
    % Initialisation al�atoire
    W0=rand(n,r); %matrice al�atoire de taille (n x r)
    H0=rand(r,m);
    
    % Initialisation par d�composition en valeurs singuli�res
    %[U,S,V] = svd(X); %X=USV'
    %W0 = U*sqrt(S);
    %H0 = sqrt(S)*V';
    %Il faut gerer les dimensions !!
    
    % Multiplicative update
    for iteration = 1 : maxIteration
        H0 = H0 .* ((W0'*((W0*H0).^(-2).*X))./(W0'*(W0*H0).^(-1)));
        W0 = W0.*((((W0*H0).^(-2).*X)*H0')./((W0*H0).^(-1)*H0'));
        
        if(Div2(X,W0*H0)<eps) 
            break;
        end

	end

    end