function [lambda,lambda_v,v0] = inverse_iteration(A,n,iter)
% A: input matrix of size n by n
% iter: Number of iterations
% lambda: Eigen value

    v0 = rand(n,1);
    v0 = v0/norm(v0);
    mu = randn(1,1);
    lambda_v = zeros(iter,1);
    for k=1:iter
        w = (A - mu*eye(size(A)))\v0;
        v0 = w/norm(w);
        lambda = v0'*A*v0;
        lambda_v(k) = lambda;
    end
end