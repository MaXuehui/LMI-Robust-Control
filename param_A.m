function res = param_A(A,t,Q,n_A,N)
    res = zeros(n_A);
    for i = t+1:N
        res=res+(A_wave(A,t,i-1,n_A))'*Q*A_wave(A,t,i-1,n_A);
    end
end