function [lambda,v0] = rayleigh_quotient(A,n,iter)
% A: input matrix of size n by n
% iter: Number of iterations
% lambda: Eigen value
% v0: Eigen vector 
    
    v0 = randn(n,1);
    v0 = v0/norm(v0);
    lambda = (v0'*A*v0)/(v0'*v0);
    for k=1:iter
        M = A - lambda*eye(size(A));
        w = M\v0;
        v0 = w/norm(w);
        lambda = v0'*A*v0;
    end
end