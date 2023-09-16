function res = param_bb(x_t,A,B,t,Q,n_A,n_B,N)
    res_temp = zeros(n_B*(N-t),n_A);
    for i = t+1:N
        res_temp=res_temp+(B_wave(A,B,t,i-1,n_A,n_B,N))'*Q*A_wave(A,t,i-1,n_A);
    end
    res = res_temp*x_t;
end