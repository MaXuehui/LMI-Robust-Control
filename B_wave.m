function res = B_wave(A,B,t,k,n_A,n_B,N)
    res = zeros(n_A,n_B*(N-t));
    for i = 1:k-t+1
        res(:,i) = A_wave(A,t+i,k,n_A)*B(:,i);
    end
end










