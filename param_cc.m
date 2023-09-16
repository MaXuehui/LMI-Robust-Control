function res = param_cc(x_t,A,t,Q,n_A,N)
    res_temp = zeros(n_A*(N-t),n_A);
    for i = t+1:N
        res_temp=res_temp+(C_wave(A,t,i-1,n_A,N))'*Q*A_wave(A,t,i-1,n_A);
    end
    res = res_temp*x_t;
end