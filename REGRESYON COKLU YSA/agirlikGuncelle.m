function Agirlik = agirlikGuncelle(Agirlik,giris,cikis)
bias = 1;
alfa = 0.5;
I=4;
for k=1:I
    transpoz=giris(k, :)';
    d = cikis(k);
    
z1=bias *-0.1+((Agirlik)*transpoz);
a1=sigmoid(z1); %cikis

hata = d -a1;
delta = a1*(1-a1)*hata;

guncelAgirlik = alfa*delta*transpoz;

    Agirlik(1)=Agirlik(1)+guncelAgirlik(1);
    Agirlik(2)=Agirlik(2)+guncelAgirlik(2);
    
 
end
end
    