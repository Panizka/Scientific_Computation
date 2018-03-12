% example 35.1 
m=200;
k = 10;
A=2*eye(m)+0.5*randn(m)/sqrt(m);
eig_A=eig(A);
figure
plot(eig_A,'x');
axis square
title('eigenvalues of A')
xlabel('real part')
ylabel('imag part')
xtrue=randn(m,1);
b = A*xtrue;
normb = norm(b);
A = sparse(A);
[x,norms] = gmres_alg(A,b,k); 
figure
semilogy(0:k,norms/normb,'--o')
xlabel('iteration')
ylabel(' norm( b - A * xn ) / norm(b)')
title('convergence of residual in gmres')


