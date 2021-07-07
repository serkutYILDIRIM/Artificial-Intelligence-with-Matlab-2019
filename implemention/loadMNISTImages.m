function images = loadMNISTImages(filename)

fp = fopen(filename, 'rb'); %dosyamýz text tipinde olmadýðý için rb parametresi kullandýk
assert(fp ~= -1, ['Could not open ', filename, '']); %Bu satýr dosyayý açamazsa bir hata mesajý gösteriyor.
magic = fread(fp, 1, 'int32', 0, 'ieee-be'); % Bu satýrda, daha önce açmýþ olduðumuz dosyadaki (fp) verileri okuyor ve verileri 'magic' adlý bir deðiþkene yüklüyoruz.
assert(magic == 2051, ['Bad magic number in ', filename, '']); %Verileri okurken herhangi bir hata varsa, bu satýrda bir hata mesajý verir.
numImages = fread(fp, 1, 'int32', 0, 'ieee-be');%sonraki üç satýr (7,8,9) görüntü sayýsýný, satýr sayýsýný ve sütun sayýsýný okur 
numRows = fread(fp, 1, 'int32', 0, 'ieee-be'); %ve bu bilgiyi adlandýrýlmýþ üç deðiþkende saklar.'num images','numRows' ve 'numCols'
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
images = fread(fp, inf, 'unsigned char=>unsigned char');%sonraki üç satýrda(10,11,12), sütun sayýsýný, satýr ve görüntü sayýsýný kullanarak 
images = reshape(images, numCols, numRows, numImages);% yeniden biçimlendiren görüntüleri okuyup permute göre sýralýyoruz.
images = permute(images,[2 1 3]);
fclose(fp);

images = reshape(images, size(images, 1) * size(images, 2),size(images, 3));% en sondaki 2 satýrda ise 
images = double(images) / 255; % bu fonksiyon yeniden biçimlendirilmiþ 8 bit görüntüler döndürür

end