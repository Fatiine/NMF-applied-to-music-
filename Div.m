function dist=Div(A,B)
    %La fonction retourne la divergence D(A||B)
    
    dist=0;
    for i=1:size(A,1)
        for j=1:size(A,2)
            
            if (A(i,j)==0 | B(i,j)==0)
                disp('Les matrices doivent être non-négatives')
                break
            end
                
            dist = dist + A(i,j)*log(A(i,j)/B(i,j)) - A(i,j) + B(i,j);
            
        end
    end
    
end