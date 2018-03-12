A = [0 1
     0 0
     0 0];
 
sigma = [1 0
         0 0
         0 0]; % calculated by hand
     
[u,s,v] = svd(A);

s
norm(sigma - s)

s =

     1     0
     0     0
     0     0


ans =

     0
