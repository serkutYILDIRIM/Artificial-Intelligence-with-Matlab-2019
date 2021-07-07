function y = Pool(x) %Pool fonksiyonu tek girdi al�yor

[xrow, xcol, numFilters] = size(x);
y = zeros(xrow/2, xcol/2, numFilters);

for k =1:numFilters
    filter = ones(2) / (2*2);
    image = conv2(x(:, :, k), filter, 'valid'); %ve konvolisyonu ger�ekle�tirmek i�in Matlab'�n 'Conv2' fonksiyonunu kullan�yor
    y(:, :, k) = image(1:2:end, 1:2:end);
end
end
%Cnn'imizi e�itmek i�in bir fonksiyon yazal�m