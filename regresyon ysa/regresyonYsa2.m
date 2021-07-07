close all
netconf = [10 40 20 50];

net = feedforwardnet (netconf);
net = train(net,rx.',ry.');



figure; hold on;
plot( x2, y2 );
plot( rx, ry, 'x' );
