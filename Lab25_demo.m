% inrtegral of e^(x)
points1 = 205;
polys = 4;
a = -1;
b = 1;

integral_val_1 = integral_lanczos(@myfun1,a,b,205,polys,1);



% integral value by matlab
true_int = integral(@myfun1,a,b);
true_int2 = integral(@myfun2,a,b);

abs(q - integral_val_1)
abs(q - integral_val_2)

% plots
N = 40;
diff_1 = zeros(N,1);
for n=1:N
    int_val = integral_lanczos(@myfun1,-1,1,points1,n,0);
    diff_1(n) = abs(true_int - int_val);
end

semilogy(1:N, diff_1,'*-r')
xlabel('number of polys');
ylabel('absolute differecne between true and calculated integral');


% inrtegral of e^(|x|)

% plots
N = 40;
diff_1 = zeros(N,1);
for n=1:N
    int_val = integral_lanczos(@myfun2,-1,1,points1,n,0);
    diff_1(n) = abs(true_int2 - int_val);
end

semilogy(1:N, diff_1,'*-r')
xlabel('number of polys');
ylabel('absolute differecne between true and calculated integral');

