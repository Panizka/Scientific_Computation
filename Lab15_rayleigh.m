clear
n = 10;
epsilon = 10*10^(-5);
iter = 5;

for i = 1:4
    A = randn(n,1);
    A_sym = toeplitz(A);
    [R] = hh_reduction(A_sym);
    eig_A = eig(A_sym);
    [lambda1,lambda_v1,v01] = rayleigh_quotient(R,n,iter);
    indx_1 = find(abs(lambda1 - eig_A) < epsilon);
    figure
    plot((1:iter),(lambda_v1),'-b*');
    hold on
    true_eig = eig_A(indx_1).*ones(1,iter);
    plot((1:iter), true_eig,'-r*');
    xlabel('Iteration');
    ylabel('Eigen value');
    legend('Rayleigh W HH','True Eig');
end

