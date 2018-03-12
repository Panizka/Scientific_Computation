function [T,Q] = lanczos_alg(A,b,k)
% Implementation of Lanczos algorithm for findin the eigenvalues of 
% a symmetric matrix
% Input
%       A - Input matrix such that A lambda = lambda x
%       b - random vector
%       k - Number of Lanczos iterations

    Q = zeros(size(A,1),k+2);
    Q(:,2) = b/norm(b);
    T = zeros(k+2,k+1);
    for n=2:k+1
        q_n = Q(:,n);
        v = A*q_n;
        alpha_n = q_n'*v;
        T(n,n) = alpha_n;
        v = v - T(n,n-1)*Q(:,n-1)-alpha_n*q_n;
        betha_n = norm(v);
        T(n+1,n) = betha_n;
        T(n,n+1) = betha_n;
        Q(:,n+1) = v/betha_n;
    end

    T = T(2:end,2:end-1);
    Q = Q(:,2:end);
end