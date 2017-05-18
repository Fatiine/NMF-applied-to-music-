function [W,H]=NMFdiv(X,r,eps,maxIteration)
    % The fonction retourne W et H tel que X~WH
    % r est le rang de factorisation
    % eps controle la qualité de l'approximation
    
    [n,m]=size(X);
    % Initialisation aléatoire
    W0=rand(n,r); %matrice aléatoire de taille (n x r)
    H0=rand(r,m);
    
    % Multiplicative update
    for iteration=1:maxIteration
        %Calcul de H
        produit = W0*H0;
        for a=1:r
            for u=1:m
                numerateur=0;
                denominateur=0;
                for i=1:n
                    numerateur = numerateur + W0(i,a)*X(i,u)/ produit(i,u);
                    denominateur = denominateur + W0(i,a);
                end
                H(a,u) = H0(a,u) * numerateur / denominateur;
            end
        end
        %Calcul de W
        produit = W0*H;
        for i=1:n
            for a=1:r
                numerateur=0;
                denominateur=0;
                for u=1:m
                    numerateur = numerateur + H(a,u)*X(i,u)/ produit(i,u);
                    denominateur = denominateur + H(a,u);
                end
                W(i,a) = W0(i,a) * numerateur / denominateur;
            end
        end
        %actualisation
        W0 = W;
        H0 = H;
        %Test
        if(Div(X,W*H)<eps) %divergence
            break;
        end

    end
end