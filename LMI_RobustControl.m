clear 
clc

N = 30;

A_true = [0.60  0.70;  0.25  0.59];
B_true = [3;  0.3];
C_true = [0  1];

n_x = 2;
n_u = 1;

for k = 1:N
    A(:,:,k) = A_true;
    B(:,k) = B_true;
    C(:,:,k) = C_true;
end

for k = 1:N
    W(:,:,k) = [(0.1*atan(k))^2  0; 0  (0.1*atan(k))^2];
    V(k) = (0.1*atan(k))^2;
end

Q = [0.8  0; 0  0.8];
R = 1;

x(:,1) = [1; 1];
for t = 1:N-1

    yalmip('clear')
    rho = sdpvar(1,1);
    tau = sdpvar(1,1);
    z_v = sdpvar(N-t,1);
    F = (param_B(A,B,t,Q,R,n_x,n_u,N))^(-1/2)*param_D(A,B,t,Q,n_x,n_u,N);
    h = param_cc(x(:,t),A,t,Q,n_x,N)-(param_D(A,B,t,Q,n_x,n_u,N))'*(param_B(A,B,t,Q,R,n_x,n_u,N))^(-1)*param_bb(x(:,t),A,B,t,Q,n_x,n_u,N);
    Matrix_LMI = [ [eye(N-t,N-t)  z_v   F;
                    z_v'  rho-tau*(N-t)  -h';
                    F'  -h   -param_C(A,t,Q,n_x,N)+tau*P_W(W,t,n_x,N)+F'*F ] >= 0 ];
    Matrix_LMI = [Matrix_LMI, tau>=0];
    sol = optimize(Matrix_LMI, rho);
    z_val = value(z_v);
    u_val = (param_B(A,B,t,Q,R,n_x,n_u,N))^(-1/2)*z_val-(param_B(A,B,t,Q,R,n_x,n_u,N))^(-1)*param_bb(x(:,t),A,B,t,Q,n_x,n_u,N);
    u(t) = u_val(1);

    clear z_val u_val
    x(:,t+1) = A(:,:,t)*x(:,t)+B(:,t)*u(t)+w_noise_2D(W(:,:,t));

end

figure(1)
plot(x(1,:));hold on;
plot(x(2,:));hold off;






















