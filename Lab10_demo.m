psi=-1:0.01:1;
x_rls = zeros(2,size(psi,2));
x_ls = zeros(2,size(psi,2));
A = [1.5 1.5; 1.0 0.99];
b = [3;2];
x_true = A\b;
for i=1:size(psi,2)
    x_rls(:,i) = robust_least_square(A,b,psi(i)); 
    x_ls(:,i) = x_true;
end

subplot(2,1,1)
plot(psi,round(x_rls(1,:)), 'b','LineWidth',2.2)
hold on
plot(psi,x_ls(1,:), 'r','LineWidth',5)
subplot(2,1,2)
plot(psi,round(x_rls(2,:)),'b','LineWidth',2.25)
hold on
plot(psi,x_ls(2,:),'r','LineWidth',3)



