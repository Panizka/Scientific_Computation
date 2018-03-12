[U,X] = qr(randn(80));
[V,X] = qr(randn(80));
S = diag(2.^(-1:-1:-80));

A = U*S*V;

[QC,RC] = qr_classic(A);
[QM,RM] = qr_modified(A);

d1 = diag(RC); semilogy(d1,'*'); hold
d2 = diag(RM); semilogy(d2,'or');
