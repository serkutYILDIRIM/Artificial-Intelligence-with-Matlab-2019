function rng(x)

randn('seed', x)
rand('seed', x)

end

% Cnn'imizi test etmek i�in bir implement fonksiyonuna ihtiyac�m�z var
% bu y�zden Rasgele dizi ve rasgele say� �retebilen bir random
% fonksiyonu kullan�yoruz
%Convolisyon ve pooling i�lemlerinden sonra maske i�indeki g�r�nt�y� elde
%etmek i�in random fonksiyonuna ihtiyac�m�z var
%��nk� Cnn maske i�eri�ini bilmez rastgele al�r.
%Maksat maskeler ne olacak.Maske random de�erlerle ba�lar maske say�sana
%kadar random de�erler al�r.
%Bu fonksiyonla birlikte art�k cnn'imizi test edebiliriz bunun i�in 
%TestMninstConv fonksiyonunu yazd�k