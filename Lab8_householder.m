A = [0.70000 0.70711;
    0.70001 0.70711];

[QH,RH] = qr_hh(A); %compute factor Q by Householder
norm(QH'*QH-eye(2))
    ans =  3.1117e-016

[QM,RM] = qr_modified(A); %compute facror Q by modified GS
norm(QM'*QM-eye(2))
    ans = 2.3014e-011