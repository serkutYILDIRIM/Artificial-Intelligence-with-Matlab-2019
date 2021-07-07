load('Trained_Network.mat');
input = [ 0 0 1;
          0 1 1;
          1 0 1;
          1 1 1;
          ];
N = 4;
for k = 1:N
    transposed_Input = input(k, :)';
    weighted_Sum = Weight*transposed_Input;
    output = Sigmoid(weighted_Sum)
end

deger=100;
a=-1;
b=1;
rx = a + (b-a).*rand(deger,1);
ry = -0.5*rx.^3+1*cos(rx*5)+exp(rx)-2+0.2*(abs(rx)+1).*randn(deger,1);
plot(rx,ry,'x');

if (output < 1.0)
    x2=-1:0.05:1;
y2=0.5*x2.^3+1*cos(x2*5)+exp(x2)-2;
hold on;plot(x2,y2,'-');
end