function [D] = qr_practical_main(T, k)
    m = size(T,1);
    %[T] = hh_reduction(A);
    D = zeros(m,k);
    epsilon = 10^(-3);
    for i=1:k
        mu = T(m,m);
        [Q,R] = qr(T - mu.*eye(size(T)));
        T = R*Q + mu.*eye(size(T));
        for j = 1:m-1
            if(abs(T(j,j+1)) < epsilon)  
                T(j,j+1) = 0;
                T(j+1,j) = 0;
                if(size(T(1:j,1:j),1) > 1 && size(T(j+1:end,j+1:end),1) > 1 )
                    qr_practical(T(1:j,1:j),k);
                    qr_practical(T(j+1:end,j+1:end),k);
                end
            end
        end
        D(:,i) = diag(T);
        i
    end
end