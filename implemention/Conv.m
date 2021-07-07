function y = Conv(x, W) % bu fonksiyon 2 girdi alýr bu yüzden konvolisyon iþlemini uygulayamýyoruz

[wrow, wcol, numFilters] = size(W);
[xrow, xcol, ~         ] = size(x);

yrow = xrow - wrow + 1;
ycol = xcol - wcol + 1;

y = zeros(yrow, ycol, numFilters);

for k = 1:numFilters
    filter = W(:, :, k);
    filter = rot90(squeeze(filter), 2);%ama Matlabýn zaten hazýr bir fonsiyonu var
    y(:, :, k) = conv2(x, filter, 'valid');%Biz sadece konvolisyon iþlemi gerçekleþtirmek için bu fonksiyonu çaðýrýyoruz
    end 
end
%konvolisyon katmanýndan sonra pooling katmanýný cnn de uygulamak için bir
%pooling fonksiyonu yazmamýz lazým.