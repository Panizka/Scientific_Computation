clear
n = 10;

for i = 1:5
    A = randn(n,1);
    A_sym = toeplitz(A);
    [R] = hh_reduction(A_sym);
    r = norm(sort(eig(R)) - sort(eig(A_sym)))
end

>> Lab14

r =

   5.5269e-15


r =

   1.4156e-14


r =

   1.2351e-14


r =

   6.8803e-15


r =

   7.7286e-15



