function ArtiliData = x;
clear all
load('Train.mat');%Ysa dan gelen deðerleri tutmak için yazdýk
bolum=10;
iterasyon=1/bolum;

   adim=0; % x1 sütunu
   for k=1:bolum
       adim=adim+iterasyon;  
       for h=1:bolum
         data(k*bolum+h,1)=adim; %x1 sütünundaki datamýz burda oluþuyor
       end
   end
   
  adim=0; % x2 sütunu
   for k=1:bolum
       adim=0;
       for h=1:bolum
         adim=adim+iterasyon; % 
         data(k*bolum+h,2)=adim;%x2 sütünundaki datamýz burda oluþuyor
       end
   end

    I=bolum^2;
    for k=1:I
         transpozData=data(k, :)';
          agirlik_top=Agirlik*transpozData; %Ysa dan gelen Agirlik sonucuna göre data sýnýflandýrýlýyor
           cikis(k)=sigmoid(agirlik_top)%sigmoitle 0-1 arasýna çekiyoruz
         

           
    end
   
    figure(1) % sýnýflandýrma sonucu oluþan datayý ekrana bastýk
   for j=1:bolum^2
       if cikis(j)<=0.54
          plot(data(j,1),data(j,2),'g+');
          hold on
          
       else
          plot(data(j,1),data(j,2),'b*'); 
          hold on
       end
   end
   figure(2) %datayý ekrana bastýk
   for k=1:bolum^2
          plot(data(k,1),data(k,2),'kx');
          hold on
   end
  
  data
 end
   
