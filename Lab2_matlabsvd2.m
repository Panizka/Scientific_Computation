A = [1 1
     0 1
     0 0];
 
sigma = [sqrt((3+sqrt(5))/2) 0
         0 sqrt((3-sqrt(5))/2)
         0 0]; % calculated by hand
     
[u,s,v] = svd(A);

s
norm(sigma - s)

s =

    1.6180         0
         0    0.6180
         0         0


ans =

     0





