m = 1000;
A = zeros(m,m);
for i=1:m
    for j=1:m
        if(i==j)
            A(i,j) = sqrt(i);
        elseif(abs(i-j) == 1)
            A(i,j) = 1;
        elseif(abs(i-j) == 100)
            A(i,j) = 1;
        else
            A(i,j) = 0;
        end
    end
end

A_p = sparse(A);
b = randn(size(A,1),1);
k = 30;
min_eig_A = min((eig(A))).*ones(k,1);
min_eig_T = zeros(k,1);

for n=1:k
    [T,Q] = lanczos_alg(A_p,b,n);
    T_n = T(1:n,:);
    min_eig_T(n) = min(eig(T_n));
end

figure
semilogy(1:k,abs(min_eig_T - min_eig_A),'-*b')
xlabel('Lanczos iteration');
ylabel('absolute difference between the smallest eigs of A and T');