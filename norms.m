x = zeros(4,1);
A = zeros(5,3);
R = zeros(1000,4);

for i=1:1000
    x = randn(size(x));
    R(i,1) = norm(x,2) - norm(x,Inf); 
end

for i=1:1000
    x = randn(size(x));
    R(i,2) = sqrt(size(x,1)) * norm(x,Inf) - norm(x,2);
end

for i=1:1000
    A = randn(size(A));
    R(i,3) = sqrt(size(A,2)) * norm(A,2) - norm(A,Inf);
end

for i=1:1000
    A = randn(size(A));
    R(i,4) = sqrt(size(A,1)) * norm(A,Inf) - norm(A,2);
end

plot(R(:,1),1,'-bo','LineWidth',5);
hold on
plot(R(:,2),2,'-go','LineWidth',5);
plot(R(:,3),3,'-ro','LineWidth',5);
plot(R(:,4),4,'-yo','LineWidth',5);