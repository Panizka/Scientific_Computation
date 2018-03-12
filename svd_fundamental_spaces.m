A = randn(2,2);
[u,s,v] = svd(A);
u_s = u * s;
angle = atan2(u(1,1), u(2,1));
R = [ cos(angle) sin(angle); -sin(angle) cos(angle) ];

% plot SVD
subplot(2,1,1); 
plot([0 v(1,1)], [0 v(2,1)],'-b','LineWidth',2);
hold on;
plot([0 v(1,2)], [0 v(2,2)],'-b','LineWidth',2);
theta=0:0.01:2*pi;
x=cos(theta);
y=sin(theta);
for i = 1:size(x,2)
    plot(x(i),y(i),'-r');
end
subplot(2,1,2); 
plot([0 u_s(1,1)], [0 u_s(2,1)],'-b','LineWidth',2);
hold on;
plot([0 u_s(1,2)], [0 u_s(2,2)],'-b','LineWidth',2);
for i = 1:size(x,2)
    data = A*[x(i) y(i)]';
    plot(data(1),data(2),'-r');
end


