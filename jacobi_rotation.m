function [D,sumsqrs] = jacobi_rotation(A,sweep)
% Implementing the QR algorithm Jacobi rotation
% Syntax:  [V,D,sumsqrs] = jacobi_rotation(A,sweep)
%
% Inputs:
%    A - Tridiagonal input matrix
%    sweep - Number of sweeps
%   
% Outputs:
%    D - Diagonal of this matrix contains the Ritz valus
%    sumsqrs - Sum of square of off diagonal entries
D = A;
n = size(A,1);
V = eye(n);
progress = 0;

while (progress < sweep)
	t = sum(diag(D));
    for p = 1:(n-1),
      for q = (p+1):n,
          t = D(p,q)/(D(q,q) - D(p,p));
          c = 1/sqrt(t*t+1);
          s = c*t;
          R = [c s; -s c];
          D([p q],:) = R'*D([p q],:);
          D(:,[p q]) = D(:,[p q])*R;
      end
    end
    progress = progress + 1
    off_diag_1 = diag(D,1);
    off_diag_2 = diag(D,-1);
    off_diag = [off_diag_1 off_diag_2]; 
    sumsqrs(progress) = sumsqr(off_diag);
    
end
D = diag(diag(D));
end
