function res = param_B(A,B,t,Q,R,n_A,n_B,N)
    res = zeros(n_B*(N-t),n_B*(N-t));
    for i = t+1:N
        res=res+(B_wave(A,B,t,i-1,n_A,n_B,N))'*Q*B_wave(A,B,t,i-1,n_A,n_B,N);
    end
    matrix_R = zeros(n_B*(N-t),n_B*(N-t));
    for i = 1:N-t
        matrix_R(i,i) = R;
    end
    res = res + matrix_R;
end