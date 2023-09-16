function res = param_C(A,t,Q,n_A,N)
    res = zeros(n_A*(N-t),n_A*(N-t));
    for i = t+1:N
        res=res+(C_wave(A,t,i-1,n_A,N))'*Q*C_wave(A,t,i-1,n_A,N);
    end
end