resim =imread('cameraman.tif');
konSonuc1 = konvolisyon(resim);
reluSonuc1 = reLU(konSonuc1);

for i=1:5
    konSonuc2 = konvolisyon(resim);
    reluSonuc2 = reLU(konSonuc2);
end

konvolisyonToplam = reluSonuc1 + reluSonuc2;

sonuc = conv2(konvolisyonToplam,2,'same');

imshow(sonuc);