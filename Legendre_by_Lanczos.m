function [T,Q] = Legendre_by_Lanczos( points,polys,a, b, newton )
%[T,Q] = Legendre_by_Lanczos( points,polys )
%   Q is orthogonal columns,
%   T is coeffs for gauss quad

    h = b - a;
    c = (a + b)/2;
    
    beta=zeros(polys+1,1);
    alpha=zeros(polys+1,1);
    Q=zeros(points,polys+2);
    Q(:,2)=ones(points,1)./sqrt(2);
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
    w=sqrt(stepsize);

    for i=2:polys+1
        v=x_s.*Q(:,i);
        alpha(i)=(Q(:,i)'*v)*w;
        v=v-beta(i-1)*Q(:,i-1)-alpha(i)*Q(:,i);
        beta(i)=norm(v)*w;
        Q(:,i+1)=v/beta(i);
    end
    Q=Q(:,2:polys+1);
    T=diag(alpha(2:polys+1))+diag(beta(2:polys),-1)+diag(beta(2:polys),1);
end
