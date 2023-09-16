function res = param_D(A,B,t,Q,n_A,n_B,N)
    res = zeros(n_B*(N-t),n_A*(N-t));
    for i = t+1:N
        res=res+(B_wave(A,B,t,i-1,n_A,n_B,N))'*Q*C_wave(A,t,i-1,n_A,N);
    end
end