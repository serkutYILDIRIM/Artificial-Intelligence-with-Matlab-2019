function labels = loadMNISTLabels(filename)

fp = fopen(filename, 'rb');% bu satýr Mnist data setindeki label dosyasýný açar
assert(fp ~= -1, ['Could not open ', filename, '']); %Dosya açýlýrhen  herhangi bir hata varsa, bu satýr bir hata mesajý verir.

magic = fread(fp, 1, 'int32', 0, 'ieee-be');%bu satýr dosyadaki (fp) mesajý okur ve 'magic' adýnda bir deðiþkende saklar
assert(magic == 2049, ['Bad magic number in ', filename, '']); %labellar okunurken herhangi bir hata varsa bu satýrda bir hata mesaji verilir

numLabels = fread(fp, 1, 'int32', 0, 'ieee-be'); %bu satýr label sayýsýný okur
labels = fread(fp, inf, 'unsigned char'); %ve labellar 'labels' deðiþkeninde iþaretsiz karakter biçiminde saklanýr
assert(size(labels,1) == numLabels, 'Mismatch in label count');%labellar okurken herhangi bir uyuþmazlýk varsa, bu satýr bir hata mesajý verecektir.

fclose(fp);
end

%bu yüzden görüntüleri ve etiketleri MNIST veri tabanýndan yüklemek için
%iki fonksiyon kullandýk
%sonra aktivasyon fonsiyonunu oluþturuyoruz
%Ýki aktivasyon fonksiyonu kullanacaðýz - Relu aktivasyon fonksiyonu ve sofmavx aktivasyon fonksiyonu