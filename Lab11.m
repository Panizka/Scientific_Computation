R = triu(randn(50));
[Q,X] = qr(randn(50));
A = Q*R;
[Q2,R2] = qr(A);


norm(Q2-Q)
    0.0021

norm(R2-R)/norm(R)
    4.8824e-04

norm(A-Q2*R2)/norm(A)
    1.0627e-15

Q3 = Q+1e-4*randn(50);
R3 = R+1e-4*randn(50);

norm(A-Q3*R3)/norm(A)
    8.3945e-04
