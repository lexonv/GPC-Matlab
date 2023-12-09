fh = findall(0,'Type','Figure');
set( findall(fh, '-property', 'fontsize'), 'fontsize', 20)

close all;clc;clear;

%%%MPC_Prędkość
ympcdata1 = load("output_mpc_predkosc.txt");
umpcdata1 = load("control_mpc_predkosc.txt");
rmpcdata1 = load("reference_mpc_predkosc.txt");

holder1 = zeros(10001,1);
holder2 = zeros(10001,1);
holder3 = zeros(10001,1);

for i = 1:1001
    for k = 1:10
    holder1(k + i*10 - 10) = ympcdata1(i);
    holder2(k + i*10 - 10) = umpcdata1(i);
    holder3(k + i*10 - 10) = rmpcdata1(i);
    end
end

ympcdata1 = holder1(1:10001);
umpcdata1 = holder2(1:10001);
rmpcdata1 = holder3(1:10001);

%%% MPC_Położenie
ympcdata2 = load("output_mpc_polozenie.txt");
umpcdata2 = load("control_mpc_polozenie.txt");
rmpcdata2 = load("reference_mpc_polozenie.txt");

%PID_Położenie_MATLAB
ypiddata1 = load("output_pid_polozenie.txt");
upiddata1 = load("control_pid_polozenie.txt");

%PID_Prędkość_MATLAB
ypiddata2 = load("output_pid_predkosc.txt");
upiddata2 = load("control_pid_predkosc.txt");

%LQR_Polozenie
ylqrdata = load("output_lqr_polozenie.txt");
ulqrdata = load("control_lqr_polozenie.txt");

%PID_Prędkość_PLC
datay = load('PID_PLC_OUTPUT.txt');
datau = load('PID_PLC_CONTROL.txt');
datau = datau/100;


%PID_Położenie_PLC
data1 = load('pomiary_polozenie.txt');
datay1 = data1(510:1510);
datau1 = data1(4511:5511);
datau1 = datau1/100;

datay1 = datay1 - 24*ones(1,1001);

samples = 1:1100;
samples = samples*0.01;

%CZAS
t = 1:0.01:101;

calka1 = 0;calka2 = 0;calka3 = 0;
for i = 1:10001

calka1 = calka1 + 0.01*abs(ympcdata1(i) - rmpcdata1(i));
calka2 = calka2 + 0.01*abs(ypiddata2(i) - rmpcdata1(i));
calka3 = calka3 + 0.01*abs(datay(i) - rmpcdata1(i));

end
control1 = 0;control2 = 0;control3 = 0;
for i = 1:10001

    control1 = control1 + 0.01*abs(umpcdata1(i));
    control2 = control2 + 0.01*abs(upiddata2(i));
    control3 = control3 + 0.01*abs(datau(i));

end


%================= PRĘDKOŚĆ ==============================
p = plot(t,ympcdata1,"red");
hold;
plot(t,ypiddata2,"Color",[0 0.5 0])
plot(t,rmpcdata1,'--',"Color","blue")
xlabel("czas [s]")
ylabel("prędkość kątowa [rad/s]")
grid on;
axis([0 100 -10 160]);
hold;

figure;
q = plot(t,umpcdata1,"red");
hold;
plot(t,upiddata2,"Color",[0 0.5 0])
grid on;
xlabel("czas [s]")
ylabel("sygnał sterujący u(t)")
axis([0 100 -1.1 1.1]);

%================= PRĘDKOŚĆ PLC ==============================
hold;
figure;
p1 = plot(t,ympcdata1,"red");
hold;
plot(t,rmpcdata1,'--',"Color","blue")
plot(t,datay,"Color",[0 0.5 0])
xlabel("czas [s]")
ylabel("prędkość kątowa [rad/s]")
grid on;
axis([0 100 -10 160]);

figure;
q = plot(t,umpcdata1,"red");
hold;
plot(t,datau,"Color",[0 0.5 0])
grid on;
xlabel("czas [s]")
ylabel("sygnał sterujący u(t)")
axis([0 100 -1.1 1.1]);

%================= POŁOŻENIE ==============================
% p = plot(t,ympcdata2,"red");
% hold;
% plot(t,rmpcdata2,"--","Color","blue");
% plot(t,ypiddata1,"Color","#228B22");
% plot(t,ylqrdata,"Color","#b87e14")
% grid on;
% axis([0 10 -15 15]);
% xlabel("czas [s]")
% ylabel("położenie kątowe [rad]")
% hold;
% 
% figure;
% q = plot(t,umpcdata2,"red");
% hold;
% plot(t,upiddata1,"Color","#228B22")
% plot(t,ulqrdata,"Color","#b87e14")
% grid on;
% axis([0 10 -1.1 1.1]);
% xlabel("czas [s]")
% ylabel("sygnał sterujący u(t)")

%================= POŁOŻENIE PLC ==============================
% p1 = plot(t,ympcdata2,"red");
% hold;
% plot(t,rmpcdata2,"--","Color","blue");
% plot(t,datay1,"Color","#228B22");
% grid on;
% axis([0 10 -15 15]);
% xlabel("czas [s]")
% ylabel("położenie kątowe [rad]")
% hold;
% 
% figure;
% q1 = plot(t,umpcdata2,"red");
% hold;
% plot(t,datau1,"Color","#228B22")
% grid on;
% axis([0 10 -1.1 1.1]);
% xlabel("czas [s]")
% ylabel("sygnał sterujący u(t)")


