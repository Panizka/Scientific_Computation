function [C,num_add,num_mult] = strassen(A, B,num_add,num_mult)
% Impleents the Strassen multiplication
% Input: 
%       A, B: input matrices of size 2^n
% Output: 
%        C: Result of multiplication
%        num_add: Number of additions perfomed by Strassen
%        num_mult: Number of multiplications performed by Strassen

    n = length(A);
    if (n == 1)
        C = A*B;
    else
        num_mult = num_mult +7 ;
        num_add = num_add +18;
        i = 1:(n/2); 
        j = ((n/2)+1):n;
        [P1,num_add,num_mult] = strassen( A(i,i)+A(j,j), B(i,i)+B(j,j),num_add,num_mult);
        [P2,num_add,num_mult] = strassen( A(j,i)+A(j,j), B(i,i), num_add,num_mult);
        [P3,num_add,num_mult] = strassen( A(i,i), B(i,j)-B(j,j), num_add,num_mult);
        [P4,num_add,num_mult] = strassen( A(j,j), B(j,i)-B(i,i), num_add,num_mult);
        [P5,num_add,num_mult] = strassen( A(i,i)+A(i,j), B(j,j), num_add,num_mult);
        [P6,num_add,num_mult] = strassen( A(j,i)-A(i,i), B(i,i)+B(i,j), num_add,num_mult);
        [P7,num_add,num_mult] = strassen( A(i,j)-A(j,j), B(j,i)+B(j,j), num_add,num_mult);
        W = P1+P4-P5+P7;
        X = P3+P5;
        Y = P2+P4;
        Z = P1+P3-P2+P6;
        C = [ W  X;  
            Y  Z ];
    end
end