%% Experiment 1
Experiment_1 = load('Experiment_1.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ib(1:35) = Experiment_1.Ib(1:35) + 1.350e-09;
Experiment_1.Ie = (-1)*fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);

Experiment_1.Ic = Experiment_1.Ie - Experiment_1.Ib;

Theoretical_Ib = Experiment_1.Ib(16:45);
Theoretical_v = Experiment_1.Vb(16:45);

x = linspace(0.35, 0.65, 100);
fit = polyfit(Theoretical_v,log(Theoretical_Ib),1);
line = exp(fit(1) * x + fit(2));

%U_T = (0.026);
U_T = 1/(fit(1));
I_s = exp(fit(2));

theoretical_Ic = I_s*exp((Experiment_1.Vb - 0)./U_T);

figure
semilogy(Experiment_1.Vb,Experiment_1.Ic,'b*')
hold on
semilogy(Experiment_1.Vb,Experiment_1.Ib,'r*')
semilogy(x,line,'g-','LineWidth',1.5);
semilogy(Experiment_1.Vb,theoretical_Ic,'g*')
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('Experimental Collector Current','Experimental Base Current','Base Current Line of Best Fit','Theoretical Collector Current','Theoretical Base Current','Location','Southeast')
grid on
hold off

% If we want to plot a range of Currents
% figure
% semilogy(Experiment_1.Vb(16:55),Experiment_1.Ic(16:55),'b*')
% hold on
% semilogy(Experiment_1.Vb(16:55),Experiment_1.Ib(16:55),'r*')
% semilogy(x(16:end),line(16:end),'g-','LineWidth',1.5);
% semilogy(Experiment_1.Vb(16:55),theoretical_Ic(16:55),'g*')
% title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
% xlabel('Voltage [V]')
% ylabel('Current [A]')
% legend('Experimental Collector Current','Experimental Base Current','Base Current Line of Best Fit','Location','Southeast')
% grid on
% hold off

figure
semilogx(Experiment_1.Ib,Experiment_1.Ic./Experiment_1.Ib,'b*')
hold on
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Base Current [A]')
ylabel('\Beta')
legend('Experimental \Beta','Location','Southeast')
grid on
hold off

figure
loglog(Experiment_1.Ib(2:end),diff(Experiment_1.Vb)./diff(Experiment_1.Ib),'b*')
hold on
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Base Current [A]')
ylabel('R_{b}')
legend('Incremental Base Resistance(R_{b})','Theoretical Incremental Base Resistance(R_{b})','Location','Southeast')
grid on
hold off

figure
loglog(Experiment_1.Ic(2:end),diff(Experiment_1.Ic)./diff(Experiment_1.Vb),'b*')
hold on
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Collector Current [A]')
ylabel('g_{m}')
legend('Experimental Incremental Transconductance Gain (g_{m})','Theoretical Incremental Transconductance Gain (g_{m})','Location','Southeast')
grid on
hold off

%% Experiment 2
Experiment_2_200 = load('Experiment_2-200.mat');
Experiment_2_200.Ib = fliplr(Experiment_2_200.Ib);
Experiment_2_200.Ie = fliplr(Experiment_2_200.Ie);
Experiment_2_200.Vb = fliplr(Experiment_2_200.Vb);

Experiment_2_2k = load('Experiment_2-2k.mat');
Experiment_2_2k.Ib = fliplr(Experiment_2_2k.Ib);
Experiment_2_2k.Ie = fliplr(Experiment_2_2k.Ie);
Experiment_2_2k.Vb = fliplr(Experiment_2_2k.Vb);

Experiment_2_20k = load('Experiment_2-20k.mat');
Experiment_2_20k.Ib = fliplr(Experiment_2_20k.Ib);
Experiment_2_20k.Ie = fliplr(Experiment_2_20k.Ie);
Experiment_2_20k.Vb = fliplr(Experiment_2_20k.Vb);


%% Experiment 3
Experiment_3 = load('Experiment_3-20k.mat');
Experiment_3.Ib = fliplr(Experiment_3.Ib);
Experiment_3.Vb = fliplr(Experiment_3.Vb);
Experiment_3.Ve = fliplr(Experiment_3.Ve);

figure
plot(Experiment_3.Vb,Experiment_3.Ve,'*')
hold on
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
title('Voltage Transfer Characteristics for Common-Collector Amplifier Circuit')
%legend('Experimental R_1 = 51 k\Omega','Experimental R_1 = 60 k\Omega','Experimental R_1 = 71 k\Omega','Location','Northwest')
grid on
hold off



%% Experiment 4
Experiment_4_51k = load('Experiment_4-51k.mat');
Experiment_4_51k.Ib = fliplr(Experiment_4_51k.Ib);
Experiment_4_51k.Vb = fliplr(Experiment_4_51k.Vb);
Experiment_4_51k.Vout = fliplr(Experiment_4_51k.Vout);

Experiment_4_60k = load('Experiment_4-60k.mat');
Experiment_4_60k.Ib = fliplr(Experiment_4_60k.Ib);
Experiment_4_60k.Vb = fliplr(Experiment_4_60k.Vb);
Experiment_4_60k.Vout = fliplr(Experiment_4_60k.Vout);

Experiment_4_71k = load('Experiment_4-71k.mat');
Experiment_4_71k.Ib = fliplr(Experiment_4_71k.Ib);
Experiment_4_71k.Vb = fliplr(Experiment_4_71k.Vb);
Experiment_4_71k.Vout = fliplr(Experiment_4_71k.Vout);


figure
plot(Experiment_4_51k.Vb,Experiment_4_51k.Vout,'*')
hold on
plot(Experiment_4_60k.Vb,Experiment_4_60k.Vout,'*')
plot(Experiment_4_71k.Vb,Experiment_4_71k.Vout,'*')
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
title('Voltage Transfer Characteristics for Inverter Circuit')
legend('Experimental R_1 = 51 k\Omega','Experimental R_1 = 60 k\Omega','Experimental R_1 = 71 k\Omega','Location','Northeast')
grid on
hold off

