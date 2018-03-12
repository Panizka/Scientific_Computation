clear
n = 10;
iter = 50;

for i = 1:4
    A = randn(n,1);
    A_sym = toeplitz(A);
    [R] = hh_reduction(A_sym);
    eig_A = eig(A_sym);
    [lambda1,lambda_v1] = power_iteration(R,n,iter);
    [v,indx_1] = max(abs(eig_A));
    figure
    plot((1:iter),(abs(lambda_v1)),'-b*');
    hold on
    true_eig = v.*ones(1,iter);
    plot((1:iter), true_eig,'-r*');
    xlabel('Iteration');
    ylabel('Eigen value');
    legend('Power Iteration W HH','True Eig');
end