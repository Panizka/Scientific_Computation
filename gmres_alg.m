function [x , norm_res] = gmres_alg(A,b,k)
% Implementing the GMRES algorithm for solving Ax = b
% Syntax:  [x , norm_res] = gmres_alg(A,b,k)
%
% Inputs:
%    A - Input system matrix of size m*m
%    b - Input vector such that Ax = b
%    k - Number of iterations
%   
% Outputs:
%    x - Solution vector
%    norm_res - norm(b - A*x)/norm(b)

Q = [];
H = 0;
m = size(A,1);
normb = norm(b);
norm_res=normb;
Q(:,1) = b / normb;
 
for n = 1:k
    % Arnoldi 
    v = A*Q(:,n);
    for j = 1:n
        H(j,n) = Q(:,j)'* v;
        v = v  - H(j,n)*Q(:,j);
    end
    Hn = H(1:n,1:n);
    H(n+1,n) = norm(v);
    if H(n+1,n) == 0 
        break
    end    
    Q(:,n+1) = v / H(n+1,n);
    e1 = [1;zeros(n,1)];
    y = H \ (normb*e1);  
    norm_res = [norm_res,norm(H*y-normb*e1)];   
end
x= Q(:,1:n)*y;
end





