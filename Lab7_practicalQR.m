clc;
s = [10 50 100 500 1000];

for i=1:size(s,2)
    n = s(i);
    A = randn(n,n);
    b = randn(s(i),1);

    disp(['****** Timing for n = ' num2str(s(i)) ' ******'])
    
    disp('---Practical QR---')
    tic
    A_b = [A b];
    [R_Q_b] = qr_modified_R(A_b);
    x_1 = backSubstitute(R_Q_b(:,1:n),R_Q_b(:,n+1));
    toc
    
    disp('--------QR--------')
    tic
    [Q,R] = qr_modified(A);
    Q_b = Q'*b;
    x_2 = backSubstitute(R,Q_b);
    toc
    disp('*********************************')
    disp(' ')
    disp(' ')
    
end

****** Timing for n = 10 ******
---Practical QR---
Elapsed time is 0.001507 seconds.
--------QR--------
Elapsed time is 0.001771 seconds.
*********************************
 
 
****** Timing for n = 50 ******
---Practical QR---
Elapsed time is 0.005196 seconds.
--------QR--------
Elapsed time is 0.006419 seconds.
*********************************
 
 
****** Timing for n = 100 ******
---Practical QR---
Elapsed time is 0.018133 seconds.
--------QR--------
Elapsed time is 0.013165 seconds.
*********************************
 
 
****** Timing for n = 500 ******
---Practical QR---
Elapsed time is 0.416801 seconds.
--------QR--------
Elapsed time is 0.423356 seconds.
*********************************
 
 
****** Timing for n = 1000 ******
---Practical QR---
Elapsed time is 2.318204 seconds.
--------QR--------
Elapsed time is 2.442693 seconds.
*********************************


