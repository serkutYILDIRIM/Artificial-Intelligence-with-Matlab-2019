giris =[0 0 ;
        0 1 ;
        1 0 ;
        1 1 ;
        ];

        y=[0
           0
           1
           1
           ];
alfa = input ('Ogrenme Katsayisini Giriniz:');
regularizasyon = input ('Regularizsyon Katsayýsýný Giriniz:');
 Agirlik= 2*rand(1,2)-1;
 Agirlik
 %katman1
 for epoch =1:2000
     Agirlik = Method(Agirlik,giris,y,alfa,regularizasyon);
 end
 guncelAgirlik = Agirlik;
 %Katman2
 for epoch =1:2000
 guncelAgirlik = katman2(guncelAgirlik,giris,y,alfa,regularizasyon);
 end
 guncelAgirlik
 guncelAgirlik2 = guncelAgirlik;
 %Katman3
 for epoch =1:2000
 guncelAgirlik2 = katman3(guncelAgirlik2,giris,y,alfa,regularizasyon);
 end
 guncelAgirlik2
 
 save('Egitilmis_Ag.mat');