dt=0; % Baþlangýç deðer
BolmeSayisi=10;
Adim=1/BolmeSayisi;

   dt=-1; % Baþlangýç deðer
   for k=1:BolmeSayisi
       dt=dt+Adim; % 
       for h=1:BolmeSayisi
         giris(k*BolmeSayisi+h,1)=dt;
       end
   end
   
  dt=1; % Baþlangýç deðer
   for k=1:BolmeSayisi
       dt=0;
       for h=1:BolmeSayisi
         dt=dt+Adim; % 
         giris(k*BolmeSayisi+h,2)=dt;
       end
   end
   giris
   
   figure(1)
   for j=1:BolmeSayisi^2
          plot(giris(j,1),giris(j,1),'ro');
          hold on 
          plot(giris(j,2),giris(j,2),'bx'); 
          hold on
   end