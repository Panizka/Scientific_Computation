function [T_new, off_diag] = qr_shifted_main(T_old, tol)
% Implementing the QR algorithm with normal shift
% Syntax:  [T_new, off_diag] = qr_shifted_main(T_old, tol)
%
% Inputs:
%    T - Input triangular matrix
%    tol - tolerance of the off diagonals
%   
% Outputs:
%    T_new - Diagonal of this matrix contains the Ritz valus
%    off_diag - The off diagonal values at each QR iteration
    n =  size(T_old,2);
    T_new = T_old;
    mu = T_new(n,n);
    [c, i] = min(abs(diag(T_new,-1)));
    j = 0;
    off_diag = 0;
    while( c > tol )
        [Q,R] = qr(T_new - mu .* eye(size(T_new)));
        T_new =  R*Q + mu .* eye(size(T_new));
        [c,i] = min(abs(diag(T_new,-1)));
        j=j+1;
        off_diag(j) = c;
    end
    if( (i-1) > 1)
        qr_shifted(T_new(1:i-1,1:i-1), tol, off_diag, j);
    end
    if( (n-i) > 1)
        qr_shifted(T_new(i:n,i:n), tol, off_diag, j);
        deflation = deflation + 1;
    end
    deflation
end