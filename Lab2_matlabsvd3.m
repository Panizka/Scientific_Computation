A = [1 1
     0 0
     0 0];
 
sigma = [sqrt(2) 0
         0 0
         0 0]; % calculated by hand
     
[u,s,v] = svd(A);

s
norm(sigma - s)

s =

    1.4142         0
         0         0
         0         0


ans =

     0