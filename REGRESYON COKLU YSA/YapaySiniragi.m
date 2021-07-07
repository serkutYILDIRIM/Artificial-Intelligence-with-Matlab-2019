      %x1 x2
giris =[0 0 ;
        0 1 ;
        1 0 ;
        1 1 ;
        ];

       %y
    cikis=[0
           0
           1
           1
           ];
 Agirlik1= 2*rand(1,2)-1;
 Agirlik1


%katman1
for adim =1:2000
 Agirlik1= agirlikGuncelle(Agirlik1,giris,cikis);
end