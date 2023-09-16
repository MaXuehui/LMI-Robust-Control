function res = C_wave(A,t,k,n_A,N)
    res = zeros(n_A,n_A*(N-t));
    for i = 1:k-t+1
        res(:,2*i-1:2*i) = A_wave(A,t+i,k,n_A);
    end
end
