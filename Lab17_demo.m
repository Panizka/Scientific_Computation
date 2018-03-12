% Exercise 29.1
clear
N = 4;
A = hilb(N);
T = hh_reduction(A);

% QR with shifts
[ritz,off_diag] = qr_shifted_main(T, 10^-12); 

figure
step = size(off_diag,2);
for i=step:-1:1
    semilogy((i:i+1),[off_diag(i) off_diag(i)]);
    hold on
    if(i < step)
        semilogy([i+1 i+1],[off_diag(i) off_diag(i+1)]);
    end
end
xlabel('number of QR iterations');
ylabel('|t_{m,m-1}|');

norm(sort(eig(A)) - sort(diag(ritz)))

% QR with Wilkonson shift
[ritz2,off_diag2] = qr_wilkinson_shift(T,10^(-12)); 


figure
step = size(off_diag2,2);
for i=step:-1:1
    semilogy((i:i+1),[off_diag2(i) off_diag2(i)]);
    hold on
    if(i < step)
        semilogy([i+1 i+1],[off_diag2(i) off_diag2(i+1)]);
    end
end
xlabel('number of QR iterations');
ylabel('|t_{m,m-1}|');

norm(sort(eig(A)) - sort(ritz2))


% Part (e)
A = diag(15:-1:1) + ones(15,15);
T = hh_reduction(A);

[ritz,off_diag] = qr_shifted_main(A, 10^(-12),1);

figure
step = size(off_diag,2);
for i=step:-1:1
    semilogy((i:i+1),[off_diag(i) off_diag(i)]);
    hold on
    if(i < step)
        semilogy([i+1 i+1],[off_diag(i) off_diag(i+1)]);
    end
end
xlabel('number of QR iterations');
ylabel('|t_{m,m-1}|');

norm(sort(eig(A)) - sort(diag(ritz)))


[ritz2,off_diag2] = qr_wilkinson_shift(A,10^(-12)); 

figure
step = size(off_diag2,2);
for i=step:-1:1
    semilogy((i:i+1),[off_diag2(i) off_diag2(i)]);
    hold on
    if(i < step)
        semilogy([i+1 i+1],[off_diag2(i) off_diag2(i+1)]);
    end
end
xlabel('number of QR iterations');
ylabel('|t_{m,m-1}|');

norm(sort(eig(A)) - sort(ritz2))
