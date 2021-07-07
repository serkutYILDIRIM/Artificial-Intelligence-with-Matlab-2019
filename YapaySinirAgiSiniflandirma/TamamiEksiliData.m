function ArtiliData = x;
clear all
load('Train.mat');%Ysa dan gelen de�erleri tutmak i�in yazd�k
bolum=10;
iterasyon=1/bolum;

   adim=-1; % x1 s�tunu
   for k=1:bolum
       adim=adim+iterasyon;  
       for h=1:bolum
         data(k*bolum+h,1)=adim;
       end
   end
   
  adim=-1; % x2 s�tunu
   for k=1:bolum
       adim=0;
       for h=1:bolum
         adim=adim+iterasyon;  
         data(k*bolum+h,2)=adim;
       end
   end

    I=bolum^2;
    for k=1:I
         transpozData=data(k, :)';
          agirlik_top=Agirlik*transpozData;%Ysa dan gelen Agirlik sonucuna g�re data s�n�fland�r�l�yor
           cikis(k)=sigmoid(agirlik_top) %sigmoitle 0-1 aras�na �ekiyoruz
         

           
    end
   
    figure(1) % s�n�fland�rma sonucu olu�an datay� ekrana bast�k
   for j=1:bolum^2 
       if cikis(j)<=0.65
          plot(data(j,1),data(j,2),'ro');
          hold on
          
       else
          plot(data(j,1),data(j,2),'bx'); 
          hold on
       end
   end
   figure(2) %datay� ekrana bast�k
   for k=1:bolum^2
          plot(data(k,1),data(k,2),'kx'); 
          hold on
   end
  
  data

end
