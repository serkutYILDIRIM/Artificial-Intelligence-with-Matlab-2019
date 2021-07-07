function y = Pool(x) %Pool fonksiyonu tek girdi alýyor

[xrow, xcol, numFilters] = size(x);
y = zeros(xrow/2, xcol/2, numFilters);

for k =1:numFilters
    filter = ones(2) / (2*2);
    image = conv2(x(:, :, k), filter, 'valid'); %ve konvolisyonu gerçekleþtirmek için Matlab'ýn 'Conv2' fonksiyonunu kullanýyor
    y(:, :, k) = image(1:2:end, 1:2:end);
end
end
%Cnn'imizi eðitmek için bir fonksiyon yazalým