% fh = findall(0,'Type','Figure');
% set( findall(fh, '-property', 'fontsize'), 'fontsize', 20)

close all;clc;clear;

syms x;

data = load('pomiary_poloz.txt');
datay = data(1:1000);
datar = data(4001:5000);
datau = data(8001:9000);

datau = datau/100;
    
samples = 1:1000;
samples = samples*0.01;

p = plot(samples,datay,"red",samples,datar,"blue");
xlabel("czas [s]")
ylabel("prędkość kątowa [rad/s]")
grid on;
axis([0 10 5.5 30.5]);

figure;

plot(samples,datau,"Color",[0.6 0.2 0])
xlabel("czas [s]")
ylabel("sygnał sterujący u(t)")
grid on;
axis([0 10 -0.1 0.25]);
yticks([-0.05 0 0.1 0.2 0.25])
