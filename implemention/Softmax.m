function y = Softmax(x)
ex = exp(x);
y = ex / sum(ex);
end
% relu ve softmax aktivasyon fonksiyonlar�n� in�aa ettik
%Konvolisyon i�lemini ger�ekle�tirmemiz laz�m
%Bir konvolisyon fonksiyonu yazmal�y�z cnn mimarisi i�in