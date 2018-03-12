% exercise 34.3

N = 64;
A = zeros(N,N);

 
% Construct the A matrix 
for i=1:N-1
    val = i^(-1/2);
    A(i,i+1) = val;
    A(i,i) = val;
end
A(64,64) = 64^(-1/2);
 
% Plot for spectrum and pseudospectra of A
epsilon = zeros(4,1);
for i=1:4
    epsilon(i) = 10^(-i);
end
 
[u,s,v] = svd(A);
figure
plot(s,zeros(1,64),'*'); axis square

 
x = -31:1:32;
y = -31:1:32;
for i=1:4
    for k=1:N
        for j=1:N
            sigmin(j,k) = min(svd((x(k)+y(j)*1i)*eye(N)-A))*epsilon(i);
        end
    end
    figure
    contour3(x,y,sigmin)
    xlabel('x');
    ylabel('y');
    zlabel('pseudospectra');
end


% Convergence rate of Arnoldi
b = randn(N,1);
abs_diff_ev = zeros(30,1);
max_eig_diff = zeros(30,1);
true_eig = sort(eig(A),'descend');

for i=1:30 
    [Q,H] = arnoldi(A,b,i); 
    H_n = H(1:end-1,:);
    ritz = abs(eig(H_n)); 
    abs_diff_ev(i) = norm(true_eig(1:i) - ritz(1:i));
    max_eig_diff(i) = abs(max(true_eig) - max(ritz));
end

figure
semilogy((1:30),(2/3).^[1:30],'-*r');
hold on
semilogy(1:1:30,max_eig_diff,'*-b')
legend('(2/3)^n','max ritz value by Arnoldi');
xlabel('number of Arnoldi iterations');
ylabel('difference between the true amx eig and Arnoldi eig');


figure
plot(eig(A),'x') ; axis square
hold on
plot(ritz,'rx') ; axis square
legend('true eig(A)','ritz value by Arnoldi after 30 iterations');
xlabel('number of eig(A)');
ylabel('eig');

% Pseudospectra of A using the Arnoldi with H_n
for n=5:5:20
    [Q,H] = arnoldi(A,b,n); 
    H_n = H(1:end-1,:);
    for i=1:4
        for k=1:N
            for j=1:N
                sigmin_H(j,k) = min(svd((x(k)+y(j)*1i)*eye(n)-H_n))*epsilon(i);
            end
        end
        figure
        contour3(x,y,sigmin_H);
        xlabel('x');
        ylabel('y');
        zlabel('pseudospectra');
    end
end

