function [C, x] = Covariance(A,b)
    [m,n] = size(A);
    [Q_b,R] = qr_alg(A,b);
    x = backSubstitute(R,Q_b);
    sigma = norm(R * x - Q_b) /(m-n)
    C = sigma^2 .*inv(R'*R)

end