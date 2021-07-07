clear all
close all

%%
nsamp = 100;

a = -1;
b = 1;
rx = a + (b-a).*rand(nsamp,1);
ry = -0.5*rx.^3+1*cos(rx*5)+exp(rx)-2 + 0.2*(abs(rx)+1).*randn(nsamp,1);

x2 = -1:0.05:1;
y2 = -0.5*x2.^3+1*cos(x2*5)+exp(x2)-2;

figure; hold on;
plot (x2, y2 );
plot (rx, ry, 'x' );