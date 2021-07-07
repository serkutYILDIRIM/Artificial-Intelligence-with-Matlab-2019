function labels = loadMNISTLabels(filename)

fp = fopen(filename, 'rb');% bu sat�r Mnist data setindeki label dosyas�n� a�ar
assert(fp ~= -1, ['Could not open ', filename, '']); %Dosya a��l�rhen  herhangi bir hata varsa, bu sat�r bir hata mesaj� verir.

magic = fread(fp, 1, 'int32', 0, 'ieee-be');%bu sat�r dosyadaki (fp) mesaj� okur ve 'magic' ad�nda bir de�i�kende saklar
assert(magic == 2049, ['Bad magic number in ', filename, '']); %labellar okunurken herhangi bir hata varsa bu sat�rda bir hata mesaji verilir

numLabels = fread(fp, 1, 'int32', 0, 'ieee-be'); %bu sat�r label say�s�n� okur
labels = fread(fp, inf, 'unsigned char'); %ve labellar 'labels' de�i�keninde i�aretsiz karakter bi�iminde saklan�r
assert(size(labels,1) == numLabels, 'Mismatch in label count');%labellar okurken herhangi bir uyu�mazl�k varsa, bu sat�r bir hata mesaj� verecektir.

fclose(fp);
end

%G�r�nt�leri ve labellar� MNIST veri taban�ndan y�klemek i�in