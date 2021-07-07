function EksiliData = x;
clear all
load('Train.mat'); %Ysa dan gelen de�erleri tutmak i�in yazd�k
BolmeSayisi=10;
Adim=1/BolmeSayisi;

   dt=-1; % Ba�lang�� de�eri x1
   for k=1:BolmeSayisi
       dt=dt+Adim; % 
       for h=1:BolmeSayisi
         giris(k*BolmeSayisi+h,1)=dt;
       end
   end
   
  dt=0; % Ba�lang�� de�eri x2
   for k=1:BolmeSayisi
       dt=0;
       for h=1:BolmeSayisi
         dt=dt+Adim; % 
         giris(k*BolmeSayisi+h,2)=dt;
       end
   end

    I=BolmeSayisi^2;
    for k=1:I
         transpoz=giris(k, :)';
          agirlik_top=Agirlik*transpoz;
           cikis(k)=sigmoid(agirlik_top)
         

           
    end
   
    figure(1)
   for j=1:BolmeSayisi^2
       if cikis(j)<=0.52
          plot(giris(j,1),giris(j,2),'ro');
          hold on
          
       else
          plot(giris(j,1),giris(j,2),'bx'); 
          hold on
       end
   end
   figure(2)
   for k=1:BolmeSayisi^2
          plot(giris(k,1),giris(k,2),'kx');
          hold on
   end
  
  giris
end
   
