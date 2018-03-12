clear;
data = zeros(30,1);
for i=1:5
    m = 3; n = 2;
    A = randn(m,n);
    b = randn(m,1);
    [C,x] = Covariance(A,b);
    y = A*x;
    r = rank(A);
    A_pinv = pinv(A);
    [u,s,v] = svd(A);
    P_A = A*A_pinv;
    norm_b = norm(b);
    norm_y = norm(y);

    % condition numbers
    cos_theta = norm_y/norm_b;
    eta = (norm(A) * norm(x)) / norm(A*x);
    k_b_y = 1/cos_theta;
    k_b_x = cond(A)/(eta * cos_theta);

    % generate perturbations of b
    p_1 = 10^(-6).*randn(m,1);
    p_2 = 10^(-1).*randn(m,1);
    p_3 = randn(m,1);

    % comparing condition number base on definition vs theoretical
    def_k_b_y_1 = (norm(P_A*p_1) / norm(P_A *b)) * (norm_b / norm(p_1));
    def_k_b_y_2 = (norm(P_A*p_2) / norm(P_A *b)) * (norm_b / norm(p_2));
    def_k_b_y_3 = (norm(P_A*p_3) / norm(P_A *b)) * (norm_b / norm(p_3));
    
    indx = (i-1) * 6;
    data(indx + 1) = k_b_y - def_k_b_y_1;
    data(indx + 2) = k_b_y - def_k_b_y_2;
    data(indx + 3) = k_b_y - def_k_b_y_3;

    % comparing condition number base on definition vs theoretical
    def_k_b_x_1 = (norm(A_pinv*p_1) / norm(A_pinv *b)) * (norm_b / norm(p_1));
    def_k_b_x_2 = (norm(A_pinv*p_2) / norm(A_pinv *b)) * (norm_b / norm(p_2));
    def_k_b_x_3 = (norm(A_pinv*p_3) / norm(A_pinv *b)) * (norm_b / norm(p_3));
    
    data(indx + 4) = k_b_x - def_k_b_x_1;
    data(indx + 5) = k_b_x - def_k_b_x_2;
    data(indx + 6) = k_b_x - def_k_b_x_3;
end


plot(data,ones(30,1),'-b');



>> Lab12_part2

sigma =

   2.4825e-16


C =

   1.0e-31 *

    0.2597    0.0554
    0.0554    0.2930


sigma =

     0


C =

     0     0
     0     0


sigma =

   5.5511e-17


C =

   1.0e-32 *

    0.8759    0.8425
    0.8425    0.8682


sigma =

     0


C =

     0     0
     0     0


sigma =

     0


C =

     0     0
     0     0

