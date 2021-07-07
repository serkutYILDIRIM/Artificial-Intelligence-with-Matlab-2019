function images = loadMNISTImages(filename)

fp = fopen(filename, 'rb'); %dosyam�z text tipinde olmad��� i�in rb parametresi kulland�k
assert(fp ~= -1, ['Could not open ', filename, '']); %Bu sat�r dosyay� a�amazsa bir hata mesaj� g�steriyor.
magic = fread(fp, 1, 'int32', 0, 'ieee-be'); % Bu sat�rda, daha �nce a�m�� oldu�umuz dosyadaki (fp) verileri okuyor ve verileri 'magic' adl� bir de�i�kene y�kl�yoruz.
assert(magic == 2051, ['Bad magic number in ', filename, '']); %Verileri okurken herhangi bir hata varsa, bu sat�rda bir hata mesaj� verir.
numImages = fread(fp, 1, 'int32', 0, 'ieee-be');%sonraki �� sat�r (7,8,9) g�r�nt� say�s�n�, sat�r say�s�n� ve s�tun say�s�n� okur 
numRows = fread(fp, 1, 'int32', 0, 'ieee-be'); %ve bu bilgiyi adland�r�lm�� �� de�i�kende saklar.'num images','numRows' ve 'numCols'
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
images = fread(fp, inf, 'unsigned char=>unsigned char');%sonraki �� sat�rda(10,11,12), s�tun say�s�n�, sat�r ve g�r�nt� say�s�n� kullanarak 
images = reshape(images, numCols, numRows, numImages);% yeniden bi�imlendiren g�r�nt�leri okuyup permute g�re s�ral�yoruz.
images = permute(images,[2 1 3]);
fclose(fp);

images = reshape(images, size(images, 1) * size(images, 2),size(images, 3));% en sondaki 2 sat�rda ise 
images = double(images) / 255; % bu fonksiyon yeniden bi�imlendirilmi� 8 bit g�r�nt�ler d�nd�r�r

end