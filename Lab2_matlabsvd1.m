A = [1 1
     1 0
     0 1];
 
sigma = [sqrt(3) 0
         0 1
         0 0]; % calculated by hand
     
[u,s,v] = svd(A);

s
norm(sigma - s)

s =

    1.7321         0
         0    1.0000
         0         0


ans =

     0


