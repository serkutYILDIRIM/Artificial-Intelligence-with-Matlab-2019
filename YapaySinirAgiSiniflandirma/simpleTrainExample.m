clear variables;
close all;

 %0.5 ten b�y�k ve k���k olarak s�n�fland�rmak i�in kullan�yoruz
trainInput = [0,1,0,1,0,1,0,0,1,1,1];

%--------------
%trainData = [0.298767000000000,-0.256104000000000,0.659760000000000,0.571671000000000,-0.624191000000000,-0.273621000000000,-0.260345000000000,0.432404000000000,-0.296371000000000,-0.325272000000000,-1.38725300000000];
%--------------

%--------------
%trainData = loadMNISTImages('MNIST/t10k-images.idx3-ubyte');
%trainData = reshape(trainData, 28, 28, []); %28 x 28 x 1000 lik matris
%--------------
trainData = loadMNISTLabels('MNIST/t10k-labels.idx1-ubyte'); %1000 e 1 lik matris
trainData(trainData == 0) = 10;
%inputtan gelen ��kt�y�,gizli katmandaki ��kt�y� ve outputtaki ��kt�y� de�i�kenlere depoluyoruz
agDegerleri = zeros(length(trainInput),3);
agTurevleri = zeros(length(trainInput),3);

%A��rl�klara ba�lama de�eri olarak random de�er at�yoruz
agirlik1 = rand;
agirlik2 = rand;

ogrenmeKatsayisi = 0.5;

toplamHata = inf;
adim = 0;

%E�itim a�amas�
while toplamHata >= 0.001 && adim < 100000
    if(mod(adim,10000) == 0)
        toplamHata
    end
    toplamHata = 0;
    for i= 1:length(trainInput)
        %inputu a� �zerindeki yolu kullan�p t�rev alarak ysa i�ine yay�yoruz
        agDegerleri(i,1) = 1/(1+exp(-trainInput(i)));
        agTurevleri(i,1) = agDegerleri(i,1)*(1-agDegerleri(i,1));% sigmoit fonksiyonu
        input2 = agirlik1 * agDegerleri(i,1);

        agDegerleri(i,2) = 1/(1+exp(-input2));
        agTurevleri(i,2) = agDegerleri(i,2)*(1-agDegerleri(i,2));
        input3 = agirlik2 * agDegerleri(i,2);

        agDegerleri(i,3) = 1/(1+exp(-input3));
        agTurevleri(i,3) = agDegerleri(i,3)*(1-agDegerleri(i,3));

        % ��kt�lar� elde ettikten sonra ��kt�lar� kullanarak hatay� hesapl�yoruz
        toplamHata = toplamHata + abs((agDegerleri(i,3) - trainData(i)))/length(trainData);

        % A�daki hatalar� hesapl�yoruz
        error_D2 = agTurevleri(i,3)*(agDegerleri(i,3)-trainData(i));
        error_w2 = error_D2*agDegerleri(i,2);

        error_D1 = agTurevleri(i,2) * agirlik2 * error_D2;
        error_w1 = error_D1 * agDegerleri(i,1);

        %A��rl�klar� g�ncelliyoruz
        agirlik1 = agirlik1 - ogrenmeKatsayisi * error_w1;
        agirlik2 = agirlik2 - ogrenmeKatsayisi * error_w2;

    end
    adim = adim + 1;
end
% Yeni verilerle a��m�z� test ediyoruz
%testData = [0.3, 0.7, 0.65, 0.22, 0.93];
testData = [0, 0, 0, 1, 1];

for j = 1:length(testData)
    % Test datas�n� kullanara inputu a� �zerindeki yolu kullan�p t�rev alarak ysa i�ine yeniden yay�yoruz
    agDegerleri(j,1) = 1/(1+exp(trainInput(j)));
    input2 = agirlik1 * agDegerleri(j,1);
    agDegerleri(j,2) = 1/(1+exp(input2));
    input3 = agirlik2 * agDegerleri(j,2);
    agDegerleri(j,3) = 1/(1+exp(input3));
    disp([num2str(testData(j)), ' ysa De�eri: ', num2str(agDegerleri(j,3))]);
end
