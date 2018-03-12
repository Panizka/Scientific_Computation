function x = backSubstitute(R,b)
% Solving an upper triangular system by back-substitution
% R: n*n upper triangular matrix
% b: n*1 vector
% x: The solution to the linear system R x = b

n = size(b,1);
x=zeros(n,1);
for j=n:-1:1
    if (R(j,j)==0) error('Error!'); end;
    x(j)=b(j)/R(j,j);
    b(1:j-1)=b(1:j-1)-R(1:j-1,j)*x(j);
end