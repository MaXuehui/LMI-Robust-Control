function res = A_wave(A,t,k,n_A)
    res = eye(n_A,n_A);
    if k>=t
        for i = t:k
          res = A(:,:,i)*res;
        end 
    end
end