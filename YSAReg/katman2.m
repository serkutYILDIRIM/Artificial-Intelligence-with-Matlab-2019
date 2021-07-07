function Agirlik = katman2(Agirlik,giris,y,alfa,regularizasyon)

I=4;
for k=1:I
    transpoz=giris(k, :)';
    d=y(k);
    agirlik_top=Agirlik*transpoz;
    cikis=sigmoid(agirlik_top);
    
    hata = d - cikis;
    regularizasyon = cikis*(1-cikis)*hata;

    gAgirlik=alfa*regularizasyon*transpoz;
    
    Agirlik(1)=Agirlik(1)+gAgirlik(1);
    Agirlik(2)=Agirlik(2)+gAgirlik(2);
 
end
end
    