N = 10^4;

x = (1/sqrt(2)*randn(1,N));
y = (1/sqrt(2)*randn(1,N));

dx = 0.1;
xb = dx/2:dx:10;


ee = x.^2 + y.^2; %Exponential
eh = hist(ee,xb);


r = sqrt(ee);  %rayleigh
rh = hist(r,xb);

fe = eh/(N*dx);
fr = rh/(N*dx);

plot(xb,fe,xb,fr)

fexact_e = exp(-xb);
hold on
plot(xb,fexact_e)

%파란색은 원래 0에서 쭉 올라가야 하는데 에러 때문에 그러것 이다.