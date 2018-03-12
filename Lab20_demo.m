K = 7;
abs_diff = zeros(K,1);
num_add_init = 0;
num_mult_init = 0;
num_mults = zeros(K,1);
num_adds = zeros(K,1);

for k=1:K
    A = randn(2^k);
    B = randn(2^k);
    [C,num_add,num_mult] = strassen(A,B,num_add_init,num_mult_init);
    C_matlab = A*B;
    abs_diff(k) = max(max(abs(C-C_matlab)));
    num_mults(k) = num_mult;
    num_adds(k) = num_add;
end

figure
plot(1:K,abs_diff,'-*');
xlabel('K - matrix dimension of 2^K');
ylabel('maximum absolute error');


figure
plot(1:K,num_adds,'b*');
hold on
plot(1:K,num_mults,'g*');
legend('additions','multiplications');
xlabel('K - matrix dimension of 2^K');
ylabel('total number of operations');



    