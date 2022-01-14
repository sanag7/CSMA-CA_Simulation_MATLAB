x = -5:0.01:5
fg = 1/sqrt(2*pi)*exp(-x.^2/2);
plot(x,fg)

N = 10000;
x = rand(1,N);
dx = 0.25
xb = -5 : dx : 5;
y = hist(X,Xb);

