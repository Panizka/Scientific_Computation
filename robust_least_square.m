function x = robust_least_square(A,b,psi)
    [m,n] = size(A);
    [u,s,v] = svd(A);
    u_b = u'*b;
    p = zeros(n,1);
    for i=1:n
        p(i) = (s(i,i)/(s(i,i)^2 + psi)) * u_b(i);
    end
    x = v*p;
end

>> x = robust_least_square(A,b,0.01)

x =

    1.0050
    0.9950
    
>> round(x)
    1
    1