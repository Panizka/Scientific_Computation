function [ritz,off_diag] = qr_wilkinson_shift(A,tol)
% Implementing the QR algorithm with Wilkinson shift
% Syntax:  [ritz,off_diag] = qr_wilkinson_shift(A,tol)
%
% Inputs:
%    A - Input real symmetric of size m*m
%    tol - toleracen of the off diagonals
%   
% Outputs:
%    ritz - Diagonal values of input matrix after some QR iterations
%    off_diag - The off diagonal values at each QR iteration

[n,n] = size(A);
k = 1;
m = n;
iter = 0;
while m > 1
  S = A(m-1:m,m-1:m);
  if abs(S(2,1)) < tol*(abs(S(1,1)) + abs(S(2,2)))
    A(m,m-1) = 0;
    A(m-1,m) = 0;
    m = m-1;
  else
    shift = wilkinson(A);
    [Q,R] = qr(A-shift*eye(n));
    A = R*Q + shift*eye(n);
    iter = iter+1;
    [c,indx] = min(abs(diag(A,-1)));
    off_diag(iter) = c; 
  end
  k = k+1;
end
ritz = diag(A);