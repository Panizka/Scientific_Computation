function [D] = qr_pure(A, k)
    T = A;
    D = zeros(size(A,1),k);
    for i=1:k
        [Q,R] = qr(T);
        T = R*Q;
        D(:,i) = diag(T);
    end
end