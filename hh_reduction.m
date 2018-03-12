function [R] = hh_reduction(A)
% Implementation of the Householder reduction Algorithm

[m, n] = size(A);
R = A;
for k=1:m-2
    x=R(k+1:m,k);
    e = zeros(length(x),1); e(1) = 1;
    v = sign(x(1))*norm(x)*e + x;
    v = v/norm(v);
    R(k+1:m,k:m) = R(k+1:m,k:m) - 2*v*(v'*R(k+1:m,k:m));
    R(1:m,k+1:m) = R(1:m,k+1:m) - 2*(R(1:m,k+1:m)*v)*v';
end









