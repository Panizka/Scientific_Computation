function [Q,R] = qr_hh(A)
% [Q,R] = qr_hh(A)
% Q: m*m orthogonal matrix
% R: m*n upper triangular matirx

[m, n] = size(A);
I = eye(m);
Qt = eye(m);
R = A;
for i = 1:n
  e = I(:,i);
  r = R(:,i);
  r(1:i-1) = zeros(i-1, 1);
  v = r + sign(r(i)) * norm(r) * e; 
  H = I - 2 * (v*v') / (v'*v); 
  R = H * R; 
  Qt = H * Qt;
end
Q = Qt';
end



