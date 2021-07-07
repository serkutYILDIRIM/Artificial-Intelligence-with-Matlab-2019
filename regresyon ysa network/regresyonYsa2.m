close all
netconf = [10 40 50 20]; % ysanýn katman sayýsý
net=feedforwardnet(netconf);
net1 =train(net,rx.',ry.');
net2 =train(net,ra.',rb.');
net3 =train(net,rc.',rd.');
figure; hold on;
plot(x4,y4);
plot(rc,rd,'x');
figure; hold on;
plot(x3,y3);
plot(ra,rb,'x');
figure; hold on;

plot(x2,y2);
subplot(2,2,1),plot(rx,ry,'x'),title('1.data'); 
subplot(2,2,2),plot(ra,rb,'x'),title(' 2.data');
subplot(2,2,3),plot(rc,rd,'x'),title('3.data'); 

