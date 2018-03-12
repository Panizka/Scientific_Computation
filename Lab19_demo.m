k = 30;
min_s_A = zeros(1,k);
min_s_B = zeros(1,k);
cond_A = zeros(1,k);
norms = zeros(1,k);
for m=1:k
    A = ones(m);
    for i=1:m
        A(i,i) = 0.1;
    end
    A_t = triu(A);
    cond_A(m) = sqrt(cond(A_t));
    % standard SVD software
    s = svd(A_t);
    min_s_A(m) = min(s);
    % SVD by forming A*A
    B = A_t'*A_t;
    eig_B = eig(B);
    s_B = sqrt(abs(eig_B));
    min_s_B(m) = min(s_B);
    norms(m) = norm(min_s_A(m)-min_s_B(m));
end

figure
semilogy(1:k,min_s_A,'r*-',1:k,min_s_B,'b*-');
legend('standard matlab svd','forming A*A');
xlabel('matrix dimension');
ylabel('min singular value');

figure
semilogy(1:k,cond_A,'r*-',1:k,norms,'b*-');
legend('squre root of condition number','accuracy loss');
xlabel('matrix dimension');
ylabel('squre root of condition number');
