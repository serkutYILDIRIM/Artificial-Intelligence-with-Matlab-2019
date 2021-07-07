function y = Softmax(x)
ex = exp(x);
y = ex / sum(ex);
end
% relu ve softmax aktivasyon fonksiyonlarýný inþaa ettik
%Konvolisyon iþlemini gerçekleþtirmemiz lazým
%Bir konvolisyon fonksiyonu yazmalýyýz cnn mimarisi için