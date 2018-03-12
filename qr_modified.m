function [Q,R] = qr_modified(A)
% [Q,R] = qr_modified(A)
% Q: m*m orthogonal matrix
% R: m*n upper triangular matirx

[m,n] = size(A);
Q = zeros(m,m);
R = zeros(m,n);
v = A;

for i = 1:n
    R(i,i) = norm(v(:,i));
    Q(:,i) = v(:,i)/R(i,i);
    for j = (i+1):n
        R(i,j) = Q(:,i)'*v(:,j);
        v(:,j) = v(:,j) - R(i,j)*Q(:,i);
    end
end

end
