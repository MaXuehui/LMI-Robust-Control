function res = P_W(W,t,n_A,N)
    res = eye((N-t)*n_A,(N-t)*n_A);
    for i = 1:N-t
        res((i-1)*n_A+1:(i-1)*n_A+n_A, (i-1)*n_A+1:(i-1)*n_A+n_A) = inv(W(:,:,i+t-1));
    end
%     for i = t:N-1
%         res((i-1)*n_A+1:(i-1)*n_A+n_A, (i-1)*n_A+1:(i-1)*n_A+n_A) = W(:,:,i);
%     end
end