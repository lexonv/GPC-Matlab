fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 20)

close all;clc;clear;

syms x;

                % data = load('pomiary_poloz.txt');
                % datay = data(51:1050);
                % datar = data(4051:5050);
                % datau = data(8051:9050);
                
                % for i = 93:1:364
                % datau(i) = -datau(i);
                % end
                % 
                % for i = 496:1:764
                % datau(i) = -datau(i);
                % end
                % 
                % for i = 895:1:1000
                % datau(i) = -datau(i);
                % end

data = load('predkosc_pid.txt');
datay = data(74:1173);
datau = data(6001:7100);

datau = datau/100;
  
samples = 1:1100;
samples = samples*0.01;

%trajektoria referencyjna
ub = 100*ones(1,400);
lb = 50*ones(1,400);
ref = [ub,lb,100*ones(1,300)];

wskaznik = 0;
for i = 1:1:1100
wskaznik = wskaznik + 0.01*abs(datay(i)-ref(i));
end

p = plot(samples,datay,"red",samples,ref,"blue");
xlabel("czas [s]")
ylabel("prędkość kątowa [rad/s]")
grid on;
axis([0 10 45 105]);

% wskaznik = 0;
% for i = 1:50:1000
% wskaznik = wskaznik + 50*0.01*abs(datay(i)-ref(i))
% end

% offset = 12*ones(1000,1);
% for i = 1:1:1000
% pomiar_y(i) = datay(i,1) - offset(i,1);
% pomiar_r(i) = datar(i,1) - offset(i,1);
% end
% 
% wskaznik = 0;
% for i = 1:1:1000
% wskaznik = wskaznik + 0.01*abs(pomiar_y(i)-pomiar_r(i))
% end
% 
% p = plot(samples,pomiar_y,"red",samples,pomiar_r,"blue",samples,100*datau,"Color",[0.6 0.2 0]);
% xlabel("czas [s]")
% ylabel("prędkość kątowa [rad/s]")
% grid on;
% axis([0 10 -10 20]);
% 
% figure;
% 
% plot(samples,datau,"Color",[0.6 0.2 0])
% xlabel("czas [s]")
% ylabel("sygnał sterujący u(t)")
% grid on;
% axis([0 10 -0.1 0.25]);
% yticks([-0.05 0 0.1 0.2 0.25])
