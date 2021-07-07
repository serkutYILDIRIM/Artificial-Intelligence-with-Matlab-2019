function rng(x)

randn('seed', x)
rand('seed', x)

end

% Cnn'imizi test etmek için bir implement fonksiyonuna ihtiyacýmýz var
% bu yüzden Rasgele dizi ve rasgele sayý üretebilen bir random
% fonksiyonu kullanýyoruz
%Convolisyon ve pooling iþlemlerinden sonra maske içindeki görüntüyü elde
%etmek için random fonksiyonuna ihtiyacýmýz var
%Çünkü Cnn maske içeriðini bilmez rastgele alýr.
%Maksat maskeler ne olacak.Maske random deðerlerle baþlar maske sayýsana
%kadar random deðerler alýr.
%Bu fonksiyonla birlikte artýk cnn'imizi test edebiliriz bunun için 
%TestMninstConv fonksiyonunu yazdýk