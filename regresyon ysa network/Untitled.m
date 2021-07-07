x1=1
x2=2
y=1
b=1
z1=(b*-0.1)+(x1*(-0.5))+(x2*(-0.1))
z2=(b*0.2)+(x1*(0.1))+(x2*(-0.3))
a1=1./(1+exp(-z1))
a2=1./(1+exp(-z2))

q1=0.1
q2=0.3

z3=1*(0.2+(a1*(q1)))+(a2*(q2))
a3=1./(1+exp(-z3))

e=-0.41
j=1/2*(e^2)

alfa=0.05
g1=-0.1
g2=0.3

g11=g1-alfa*(j/e)*(e/a3)*(a3/z3)*(z3/g1)
g22=g2-alfa*(j/e)*(e/a3)*(a3/z3)*(z3/a2)*(a2/z2)*(z2/g2)

hold on;
plot(g11)
plot(g22)
plot(j)