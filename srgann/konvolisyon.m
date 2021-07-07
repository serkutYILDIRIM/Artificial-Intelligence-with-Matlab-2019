function y = konvolisyon(resim)
maske=[1 0 0;
       0 2 0;
      0 0 1];
y = conv2(resim, maske, 'same');
end