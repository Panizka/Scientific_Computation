function integral_val = integral_lanczos(fun, a, b, points, polys, newton)
% Calculating the integral of a function in the [a b] range using the
% Lanczos algorithm
% Syntax:  integral_val = test_legendre_by_lanczos(fun, a, b, points)
%
% Inputs:
%    fun - Function we want to calculate its integral
%    a - Lower limit of integral
%    b - Uppert limit of integral
%    points - Number of points for the Legendre
%   
% Outputs:
%    integral_val - Value of calculated integral

    

    [T,Q] = Legendre_by_Lanczos( points,polys, a, b, newton );
    
    h = b - a;
    c = (a + b)/2;
    stepsize=2/(points-1);
    if (newton == 1)
        x=(-1:stepsize:1)';
    else      
        x = ((b-a).*rand(1,points) + a)';
        x(1) = -1;
        x(end) = 1;
        x = sort(x);
    end
    
    x_s = (h/2).*x + c;

    figure;
    plot(x_s,Q')
    [V,D]=eig(T);
    gauss_pts=diag(D)';
    gauss_wt=2*(V(1,:).^2);
    gauss_pts
    gauss_wt
    
    
    integral_val = 0;
    for i=1:polys
        integral_val = fun(gauss_pts(i)) * gauss_wt(i) + integral_val
    end
    
    integral_val = ((b-a)/2) * integral_val;

end