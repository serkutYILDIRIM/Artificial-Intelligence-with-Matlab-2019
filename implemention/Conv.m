function y = Conv(x, W) % bu fonksiyon 2 girdi al�r bu y�zden konvolisyon i�lemini uygulayam�yoruz

[wrow, wcol, numFilters] = size(W);
[xrow, xcol, ~         ] = size(x);

yrow = xrow - wrow + 1;
ycol = xcol - wcol + 1;

y = zeros(yrow, ycol, numFilters);

for k = 1:numFilters
    filter = W(:, :, k);
    filter = rot90(squeeze(filter), 2);%ama Matlab�n zaten haz�r bir fonsiyonu var
    y(:, :, k) = conv2(x, filter, 'valid');%Biz sadece konvolisyon i�lemi ger�ekle�tirmek i�in bu fonksiyonu �a��r�yoruz
    end 
end
%konvolisyon katman�ndan sonra pooling katman�n� cnn de uygulamak i�in bir
%pooling fonksiyonu yazmam�z laz�m.