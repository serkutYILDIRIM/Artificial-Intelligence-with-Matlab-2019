%x1, x2 giri�lerimiz
alfa=input('��renme Katsay�s�n� Giriniz:');
secim = input('Aktivasyon Fonksiyonunu Se�in:\n1-Sigmoid\n2-Tanjant\n3-Relu\n4-Lineer\n');
katmanSayisi = input('Katman Say�s�n� giriniz:');
iterasyon = input('iterasyon Say�s�n� giriniz:'); % A��n ne kadar e�itilece�i belirleniyor
data = input ('Test datasini se�in:\n1-Art�l� Data\n2-Eksili Data\n3-Tamam� Eksili Data\n');
x1 = input('x1 inputunu giriniz');
x2 = input('x2 inputunu giriniz');
y = input ('y ��k���n� giriniz');
bias = input('bias� giriniz');
%y ��k���m�z
%y=1;

bias=1;
%1. katmandaki Ag�lr�klar
Agirlik1 = rand(1,2); %ilk a��rl�k de�erlerini rastgele giriyoruz
g11 = Agirlik1(1);
g12 = Agirlik1(2);
%1.Katman
for adimSayisi =1:iterasyon
z1=(bias*-0.1)+(x1*(g11))+(x2*(-0.1)); %ysa daki z1 z2 de�erlerini hesapl�yoruz
z2=(bias*0.2)+(x1*(0.1))+(x2*(g12));
end

if (secim == 1) %se�ime g�re aktivasyon fonksiyonu belirleniyor
    for adimSayisi =1:iterasyon
   a1=sigmoid(z1);
   a2=sigmoid(z2); 
    end
end
if (secim == 2)
    for adimSayisi =1:iterasyon
    a1=tanjant(z1);
    a2=tanjant(z2);
    end
end
if(secim == 3)
    for adimSayisi =1:iterasyon
    a1 = relu(z1);
    a2 = relu(z2);
    end
end
if(secim == 4)
    for adimSayisi =1:iterasyon
    a1 = lineer(z1);
    a2 = lineer(z2);
    end
end

%2.Katman
Agirlik2 = rand(1,2);
g21 = Agirlik2(1);
g22 = Agirlik2(2);
for adimSayisi =1:iterasyon
z3=1*(0.2+(a1*(g21)))+(a2*(g22));
end

if (secim ==1)
    for adimSayisi =1:iterasyon
a3=sigmoid(z3);
    end
end

if(secim ==2)
    for adimSayisi =1:iterasyon
    a3 = tanjant(z3);
    end
end
if(secim  == 3)
    for adimSayisi =1:iterasyon
    a3 = relu(z3);
    end
end
if(secim == 4)
    for adimSayisi =1:iterasyon
    a3 = lineer(z3);
    end
end
for adimSayisi =1:iterasyon
e=a3-y;
hata=1/2*(e^2);
end

% Geri Besleme ile a��rl�k g�ncelleme
%1. Katman
for adimSayisi =1:iterasyon
g11=g11-alfa*(hata/e)*(e/a3)*(a3/z3)*(z3/a1)*(a1/z1)*(z1/g11);
g12=g12-alfa*(hata/e)*(e/a3)*(a3/z3)*(z3/a2)*(a2/z2)*(z2/g12);
end

%2. Katman
for adimSayisi =1:iterasyon
g21=g21-alfa*(hata/e)*(e/a3)*(a3/z3)*(z3/g21);
g22=g22-alfa*(hata/e)*(e/a3)*(a3/z3)*(z3/g22);
end

%Katman Se�me k�sm�
Agirlik= zeros(1,2);
if (katmanSayisi == 1)
    for adimSayisi =1:iterasyon
    Agirlik(1) = g11;
    Agirlik(2) = g12;
    end
    Agirlik
end
if (katmanSayisi == 2)
    for adimSayisi =1:iterasyon
    Agirlik(1) = g21;
    Agirlik(2) = g22;
    end
    Agirlik
end
hata
%data se�im k�sm�
if (data == 1)
 ArtiliData();
end
if (data == 2)
 EksiliData();
end
if (data == 3)
 TamamiEksiliData();
end
save ('Train.mat');