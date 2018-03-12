A = zeros(10,20);
norms = zeros(5,1);

for i = 1:5
    A = randn(10,20);
    [u,s,v] = svd(A);
    sig_inv = s;
    sig_inv(sig_inv>0) = 1./sig_inv(sig_inv>0);
    A_pseudo = v * sig_inv' * u';
    norms(i) = norm((A_pseudo * A * A_pseudo) - A_pseudo,2);
end



