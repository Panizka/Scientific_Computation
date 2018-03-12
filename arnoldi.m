function [Q,H] = arnoldi(A,b,N)
% Implementing the Arnoldi algorithm for finding the
% eigenvalues of a matrix (A ~= A*)
% Syntax:  [Q,H] = arnoldi(A,b,N)
%
% Inputs:
%    A - Input system matrix of size m*m
%    b - Random initial vector
%    N - Number of iterations
%   
% Outputs:
%    Q - as in A = QHQ*
%    H - as in A = QHQ*

    Q = zeros(size(A,2),N+1);
    H = zeros(N+1,N);
    Q(:,1) =  b/norm(b);
    for n=1:N
        v = A*Q(:,n);
        for j=1:n
            H(j,n) = Q(:,j)'*v;
            v = v - H(j,n)*Q(:,j);
        end
        H(n+1,n)= norm(v);
        Q(:,n+1) = v/H(n+1,n);
    end
end


