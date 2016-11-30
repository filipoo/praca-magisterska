%% Program umo¿liwia symulacje ze znanymi wartosciami indukcyjnosci
% i oblicza wspolczynniki. Na ich podstawie wyznaczane jest liniowe
% przybli¿enie charatkerystyki przetwarzania czujnika

ClassicLParameters    % Wczytanie parametrow

close all; clc
 
L1tab=[0.0013 0.0019]; %znane wartosci indukcyjnosci
plotTime=0.015;


for i=1:length(L1tab)
    L1=L1tab(i);
    sim('classicLcopy')
    figure(1)
    subplot(311)
        plot(VLfil)
        hold on
        title('V_L filtered')
        xlabel('time [s]')
        ylabel('voltage [V]')
        grid on
        axis([0 plotTime 1.1*min(VLfil.data) 1.1*max(VLfil.data)])
   subplot(312)
        plot(VLfil.time,abs(VLfil.data))
        hold on
        title('V_L absolute value')
        xlabel('time [s]')
        ylabel('voltage [V]')
        grid on
        axis([0 plotTime -0.1 1.1*max(VLfil.data)])
   %voltage(i,:)=  abs(VLfil.data);
   out(i,:)=Vout.data;
    figure(1)
    subplot(313)
    plot(Vout);
    hold on;
    title('Output voltage')
    xlabel('time [s]')
    ylabel('voltage [V]')
    grid on
    axis([0 plotTime -0.1 1.2*max(Vout.data)])
    
end
%% Wymuszenie
% figure(2)
%         
%         plot(Iin.time,Iin.data)
%         xlabel('time [s]')
%         ylabel('current [A]')
%         title('Input current')
%         grid on
%%
temp=out(:,end-20:end);
avg_out=mean(temp,2);

% ytab=[min(L1tab); max(L1tab)];
% xtab=[min(avg_out) 0; 0  max(avg_out)]';
% xtab^(-1)*ytab
%% Wyznaczenie wspolczynnikow
y1=min(L1tab);
y2=max(L1tab);
x1=min(avg_out);
x2=max(avg_out);

a=(y2-y1)/(x2-x1)
b=(y1*x2-x1*y2)/(x2-x1)
disp(['y = ',num2str(a), 'x + ', num2str(b)])

%% Charakterystyka przetwornika
x=linspace(x1,x2,100);

figure
plot(x,a*x+b)
title('charakterystyka przetwarzania')
xlabel('napiecie [V]')
ylabel('indukcyjnosc [H]')


%figure(2)
 %plot(L1tab,a*avg_out+b);
 %xlabel('Inductance [H]')
 %ylabel('Voltage [V]')