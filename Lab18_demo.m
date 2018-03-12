c = ['-*r'; '-*g'; '-b*'];
sweep = 10;
for i=1:3
    m = 20*i;
    epsilon = 10^(-3);
    A = hilb(m); % create m by m sym matrix 
    A_h = hess(A); % reduce A to triangular
    [D,sumsqrs] = jacobi_rotation(A_h,10);
    eigs = sort(diag(D));
    semilogy(1:sweep,sumsqrs,c(i,:));
    hold on
end

legend('m=20','m=40','m=80');
xlabel('number of sweeps');
ylabel('sum of square of off diagonals');