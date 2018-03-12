function qr_shifted(T_new, tol, off_diag, indx)
    n =  size(T_new,2);
    mu = T_new(n,n);
    [c, i] = min(abs(diag(T_new,-1)));
    while( c > tol )
        [Q,R] = qr(T_new - mu .* eye(size(T_new)));
        T_new =  R*Q + mu .* eye(size(T_new));
        [c,i] = min(abs(diag(T_new,-1)));
        indx = indx+1;
        off_diag(indx) = c;
    end
    if( (i-1) > 1)
        qr_shifted(T_new(1:i-1,1:i-1), tol, off_diag, indx);
    end
    if( (n-i) > 1)
        qr_shifted(T_new(i:n,i:n), tol, off_diag, indx);
    end
end