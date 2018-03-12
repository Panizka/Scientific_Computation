function R = qr_modified_R(A)
% R = qr_modified_R(A)
% A: m*n (augmented) matrix
% R: n*n upper triangular matirx

[m,n] = size(A);
Q = zeros(m,n);
R = zeros(n-1,n);
v = A(:,1:n);

for i = 1:n-1
    R(i,i) = norm(v(:,i));
    Q(:,i) = v(:,i)/R(i,i);
    for j = (i+1):n
        R(i,j) = Q(:,i)'*v(:,j);
        v(:,j) = v(:,j) - R(i,j)*Q(:,i);
    end
end

end
