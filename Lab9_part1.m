clear
clc
x_true = [2.95 1.74 -1.45 1.32];
b = zeros(size(10,1));
b = [2.95,
    1.74,
    -1.45,
    1.32,
    1.23,
    4.45,
    1.61,
    3.21,
    0.45,
    -2.75];
A = eye(10,4);
A(5,1) = 1; A(5,2) = -1; 
A(6,1) = 1; A(6,3) = -1; 
A(7,1) = 1; A(7,4) = -1;
A(8,2) = 1; A(8,3) = -1;
A(9,2) = 1; A(9,4) = -1;
A(10,3)= 1; A(10,4) = -1;
[m ,n] = size(A);

[QC,RC] = qr_classic(A);
xc = RC\(QC'*b)
norm_qr_classic = norm(x_true'-xc)

[QM,RM] = qr_modified(A);
xm = RM\(QM'*b)
norm_qr_modified = norm(x_true'-xc)

[QH,RH] = qr_hh(A);
xh = RH\(QH'*b)
norm_qr_hh = norm(x_true'-xh)

[QMT,RMT] = qr(A);
xmt = RMT\(QMT'*b)
norm_qr_matlab = norm(x_true'-xmt)

[u,s,v] = svd(A);
for i=1:n
    s(i,i) = 1/s(i,i);
end
 xsvd = v*(s'*(u'*b))
 norm_svd_matlab = norm(x_true'-xsvd)
 
 
 
 xc =

    2.9600
    1.7460
   -1.4600
    1.3140


norm_qr_classic =

    0.0165


xm =

    2.9600
    1.7460
   -1.4600
    1.3140


norm_qr_modified =

    0.0165


xh =

    2.9600
    1.7460
   -1.4600
    1.3140


norm_qr_hh =

    0.0165


xmt =

    2.9600
    1.7460
   -1.4600
    1.3140


norm_qr_matlab =

    0.0165


xsvd =

    2.9600
    1.7460
   -1.4600
    1.3140


norm_svd_matlab =

    0.0165
 
 
 




