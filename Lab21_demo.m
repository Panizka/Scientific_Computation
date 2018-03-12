% Testing arnoldi with sparse matrix
n = 6;
t = 10;
for i=1:t
    A_sparse = sprandn(n,n,1); 
    b = randn(n,1);
    eig_A = eigs(A_sparse);
    [Q,H] = arnoldi(A_sparse,b,n);
    eig_H = eig(H(1:end-1,:));
    plot(i,norm(sort(eig_A) - sort(eig_H)),'r*')
    hold on
end
 xlabel('number of radom input matrices');
 ylabel('norm of the difference of eig of A vs eig of H');

% % Testing arnoldi with dense matrix
% for i=1:t
%     A_dense = randn(n); 
%     b = randn(n,1);
%     eig_A = eig(A_dense);
%     [Q,H] = arnoldi(A_dense,b,n);
%     eig_h = eig(H(1:n,:));
% end