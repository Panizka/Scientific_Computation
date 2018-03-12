A = randn(4,4);
x_true = [1 2 3 4]';
b = A*x_true;
[Q,R] = qr_modified(A);
x = backSubstitute(R,Q'*b)
norm(x-x_true)

% Results
x =

    1.0000
    2.0000
    3.0000
    4.0000


ans =

  9.5383e-013