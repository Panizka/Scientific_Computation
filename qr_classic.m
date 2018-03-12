function [Q,R] = qr_classic(A)
% [Q,R] = qr_classic(A)
% Q: m*m orthogonal matrix
% R: n*n upper triangular matirx

[m,n] = size(A);
Q = zeros(m,m);
R = zeros(m,n);

for j = 1:n
   v = A(:,j);
   for i=1:j-1
        R(i,j) = Q(:,i)'*A(:,j);
        v = v - R(i,j)*Q(:,i);
   end
   R(j,j) = norm(v);
   Q(:,j) = v/R(j,j);
end

end


            