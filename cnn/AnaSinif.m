load('MnistConv.mat')

k = 2;
%x = imread('cameraman.tif');
x = X(:, :, k);
%Ýlk Katman
y1 = Conv(x, W1);
y2 = ReLU(y1);% boyutu deðiþtirilmeden oluþan relu sonucu
konvolisyon1=y1(:, :, k);

relu1=y2(:, :, k);

%1.katman
konvolisyon2 = Conv(relu1, W1);
relu2= ReLU(konvolisyon2);

relu22 = relu2(:,:,k);

%2.katman
konvolisyon3 = Conv(relu22, W1);
relu3= ReLU(konvolisyon3);

relu33 = relu3(:,:,k);

%3.katman
konvolisyon4 = Conv(relu33, W1);
relu4= ReLU(konvolisyon4);

relu44 = relu4(:,:,k);

%4.katman
konvolisyon5 = Conv(relu44, W1);
relu5= ReLU(konvolisyon5);

relu55 = relu5(:,:,k);

%5.katman
konvolisyon6 = Conv(relu55, W1);
relu6= ReLU(konvolisyon6);

relu66 = relu6(:,:,k);

b = imresize(relu33,[20 20]);
%ilk katman + 5. katman
konvolisyonSonuc = relu1 + b;
sonuc = conv2(konvolisyonSonuc,x,'same');

figure;
Cikti(x(:));
title('Input Image')

figure;
Cikti(konvolisyon1(:));
title('convolisyon')
figure;
Cikti(relu1(:));
title('relu')

figure;
Cikti(sonuc(:));
title('En Son')
