clear all;
close all;



deger=100;
a=-1;
b=1;
rx = a + (b-a).*rand(deger,1);
ry = -0.5*rx.^3+1*cos(rx*5)+exp(rx)-2+0.2*(abs(rx)+1).*randn(deger,1);
plot(rx,ry,'x');
x2=-1:0.05:1;
y2=0.5*x2.^3+1*cos(x2*5)+exp(x2)-2;
hold on;plot(x2,y2,'-');


c=-2;
d=2;
ra = c + (d-c).*rand(deger,1);
rb = -0.2*rx.^3+1*cos(ra*5)+exp(ra)-2+0.3*(abs(ra)+1).*randn(deger,1);

x3=-2:0.05:2;
y3=0.5*x3.^3+1*cos(x3*5)+exp(x3)-2;




e=-2;
f=2;
rc = e + (f-e).*rand(deger,1);
rd = -0.2*rx.^3+1*cos(rx*5)+exp(rx)-2+0.3*(abs(rx)+1).*randn(deger,1);

x4=-2:0.05:2;
y4=0.5*x4.^3+1*cos(x4*5)+exp(x4)-2;







