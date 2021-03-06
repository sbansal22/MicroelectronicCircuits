%% Experiment 1
Experiment_1 = load('Experiment_1_NEW.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ib = Experiment_1.Ib + 1.350e-09;
Experiment_1.Ie = (-1)*fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);
Experiment_1.Ic = Experiment_1.Ie - Experiment_1.Ib;

Theoretical_1.Vb = Experiment_1.Vb(22:95);
x = linspace(0.3, 0.8, 100);
fit = polyfit(Theoretical_1.Vb,log(Experiment_1.Ic(22:95)),1);
line = exp(fit(1) * x + fit(2));

%U_T = (0.026);
U_T = 1/(fit(1));
I_s = exp(fit(2));

% Beta is assumed to be 100~.
Theoretical_Beta = 150;
Theoretical_1.Ib = (I_s./Theoretical_Beta)*exp(Experiment_1.Vb/U_T);
Theoretical_1.Ic = I_s*exp((Experiment_1.Vb)/U_T);
Theoretical_1.Ie = Theoretical_1.Ic + Theoretical_1.Ib;
Experiment_1.rb = diff(Experiment_1.Vb)./diff(Experiment_1.Ib);
Theoretical_1.rb = diff(Experiment_1.Vb)./diff(Theoretical_1.Ib);
Theoretical_1.gm = diff(Theoretical_1.Ic)./diff(Experiment_1.Vb);

figure
semilogy(Experiment_1.Vb,Experiment_1.Ic,'b*')
hold on
semilogy(x,line,'r-');
title('Transistor Parameter Extraction Plot')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('Experimental Collector Current','Collector Current Line of Best Fit','Location','Southeast')
grid on
hold off

figure
semilogy(Experiment_1.Vb,Experiment_1.Ic,'b*')
hold on
semilogy(Experiment_1.Vb,Experiment_1.Ib,'m*')
semilogy(Experiment_1.Vb,Theoretical_1.Ic,'r-')
semilogy(Experiment_1.Vb,Theoretical_1.Ib,'g-')
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Base Voltage [V]')
ylabel('Current [A]')
legend('Experimental Collector Current','Experimental Base Current','Theoretical Collector Current','Theoretical Base Current','Location','Southeast')
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
title('\beta Forward Current Gain')
xlabel('Base Current [A]')
ylabel('\beta')
legend('Experimental \beta','Location','Southeast')
grid on
hold off

% slope = (log(y2/y1)/log(x2/x1))
slope = (log(345734133.1367/125.4105)/(log((7.9252e-11)/0.00021848)));
x = logspace(-12,-3,101);
% b = y2/(x2^slope)
b = 345734133.1367/((7.9252e-11)^slope);
% y = b*(x.^slope)
y = b*(x.^slope);

y_error = b*(Experiment_1.Ib(2:end).^slope);
experimental_rb = diff(Experiment_1.Vb)./diff(Experiment_1.Ib);
% Region from [3.07700000000000e-08] to 8.280134999999999e-05
error_rb = abs(y_error(50:end-7)-experimental_rb(50:end-7))*100/y_error(50:end-7);

figure
loglog(Experiment_1.Ib(2:end),diff(Experiment_1.Vb)./diff(Experiment_1.Ib),'b*')
hold on
loglog(Theoretical_1.Ib(2:end),Theoretical_1.rb,'r-')
title('Incremental Base Resistance (r_{b})')
xlabel('Base Current [A]')
ylabel('r_{b} [\Omega]')
legend('Incremental Base Resistance(r_{b})','Theoretical Incremental Base Resistance(r_{b})','Location','Southeast')
grid on
hold off

slope = (0.98654-1.9911e-8)/(0.027031-5.4555e-10);
x = logspace(-10,-1,101);
b = 0.98654 - slope*0.027031;
y = slope * x + b;

y_error = slope * Experiment_1.Ic(2:end) + b;

experimental_gm = diff(Experiment_1.Ic)./diff(Experiment_1.Vb);
error_gm = abs(y_error(15:end-15)-experimental_gm(15:end-15))*100/y_error(15:end-15);

figure
loglog(Experiment_1.Ic(2:end),diff(Experiment_1.Ic)./diff(Experiment_1.Vb),'b*')
hold on
loglog(Theoretical_1.Ic(2:end),Theoretical_1.gm,'r-')
title('Incremental Transconductance Gain (g_{m})')
xlabel('Collector Current [A]')
ylabel('g_{m} [S]')
legend('Experimental Incremental Transconductance Gain (g_{m})','Theoretical Incremental Transconductance Gain (g_{m})','Location','Southeast')
grid on
hold off

%% Experiment 2
% Find U_T and I_s for the didoe from Experiment 1
Experiment_1 = load('Experiment_1_NEW.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ib = Experiment_1.Ib + 1.350e-09;
Experiment_1.Ie = (-1)*fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);
Experiment_1.Ic = Experiment_1.Ie - Experiment_1.Ib;

Theoretical_1.Vb = Experiment_1.Vb(22:95);
x = linspace(0.3, 0.8, 100);
fit = polyfit(Theoretical_1.Vb,log(Experiment_1.Ic(22:95)),1);
line = exp(fit(1) * x + fit(2));
U_T = 1/(fit(1));
I_s = exp(fit(2));

% Experiment 2 Code
Experiment_2_200 = load('Experiment_2-200_NEW.mat');
Experiment_2_200.Ib = fliplr(Experiment_2_200.Ib)+5.4e-9;
Experiment_2_200.Ie = (-1)*fliplr(Experiment_2_200.Ie);
Experiment_2_200.Vb = fliplr(Experiment_2_200.Vb);
Experiment_2_200.Ic = Experiment_2_200.Ie - Experiment_2_200.Ib;
x200 = linspace(0.35,0.75,101);
fit200 = polyfit(Experiment_2_200.Vb(8:13),log(Experiment_2_200.Ie(8:13)),1);
line200 = exp(fit200(1)*x200 + fit200(2));
slope200 = fit200(1);
intercept200 = exp(fit200(2));

% error200 = (Experiment_2_200.Ie(15:end-15)-line200(15:end-15))*100./Experiment_2_200.Ie(15:end-15);

Experiment_2_2k = load('Experiment_2-2k_NEW.mat');
Experiment_2_2k.Ib = fliplr(Experiment_2_2k.Ib)+4.77e-10;
Experiment_2_2k.Ie = (-1)*fliplr(Experiment_2_2k.Ie);
Experiment_2_2k.Vb = fliplr(Experiment_2_2k.Vb);
Experiment_2_2k.Ic = Experiment_2_2k.Ie - Experiment_2_2k.Ib;

x2k = linspace(0.35,0.65,200);
fit2k = polyfit(Experiment_2_2k.Vb(8:13),log(Experiment_2_2k.Ie(8:13)),1);
line2k = exp(fit2k(1)*x2k + fit2k(2));
slope2k = fit2k(1);
intercept2k = exp(fit2k(2));

% error2l = (Experiment_2_2k.Ic(15:end-15)-line2k(15:end-15))*100./Experiment_2_2k.Ic(15:end-15);

Experiment_2_20k = load('Experiment_2-20k_NEW.mat');
Experiment_2_20k.Ib = fliplr(Experiment_2_20k.Ib)+1e-8;
Experiment_2_20k.Ie = (-1)*fliplr(Experiment_2_20k.Ie);
Experiment_2_20k.Vb = fliplr(Experiment_2_20k.Vb);
Experiment_2_20k.Ic = Experiment_2_20k.Ie - Experiment_2_20k.Ib;

x20k = linspace(0.4,0.65,200);
fit20k = polyfit(Experiment_2_20k.Vb(9:13),log(Experiment_2_20k.Ie(9:13)),1);
line20k = exp(fit20k(1)*x20k + fit20k(2));
slope20k = fit20k(1);
intercept20k = exp(fit20k(2));

% error20k = (Experiment_2_20k.Ie(15:end-15)-line20k(15:end-15))*100./Experiment_2_20k.Ie(15:end-15);

figure
semilogy(Experiment_2_200.Vb,Experiment_2_200.Ic,'b*')
hold on
semilogy(Experiment_2_2k.Vb,Experiment_2_2k.Ic,'g*')
semilogy(Experiment_2_20k.Vb,Experiment_2_20k.Ic,'m*')
semilogy(x,line,'r-')
%semilogy(x200,line200,'r-');
%semilogy(x2k,line2k,'k-');
%semilogy(x20k,line20k,'c-');
title('Emitter-Degenerated Bipolar Collector Current Characteristics')
xlabel('Base Voltage [V]')
ylabel('Collector Current [A]')
%legend('Experimental R = 200 \Omega','Experimental R = 2k \Omega','Experimental R = 20k \Omega',...
%    'Theoretical R = 200 \Omega','Theoretical R = 2k \Omega','Theoretical R = 20k \Omega','Location','Southeast')
legend('Experimental R = 200 \Omega','Experimental R = 2k \Omega','Experimental R = 20k \Omega',...
    'Theoretical Collector Current Characteristics from Experiment 1','Location','Southeast')
grid on
hold off

%x200Ic = linspace(0.6,4.85,200);
x200Ic = linspace(0.6,5,101);
fit200Ic = polyfit(Experiment_2_200.Vb(13:98),(Experiment_2_200.Ic(13:98)),1);
line200Ic = (fit200Ic(1)*x200Ic + fit200Ic(2));
slope200Ic = fit200Ic(1);
intercept200Ic = (fit200Ic(2));

line200IcEr = (fit200Ic(1)*Experiment_2_200.Vb + fit200Ic(2));
error200Ic = mean(abs(Experiment_2_200.Ic(20:end-20)-line200IcEr(20:end-20))*100./Experiment_2_200.Ic(20:end-20));


figure
plot(Experiment_2_200.Vb,Experiment_2_200.Ic,'b*')
hold on
plot(x200Ic,line200Ic,'r-')
title('Emitter-Degenerated Bipolar Collector Current Characteristics R = 200 \Omega')
xlabel('Base Voltage [V]')
ylabel('Collector Current [A]')
legend('Experimental R = 200 \Omega','Theoretical R = 200 \Omega','Location','Southeast')
grid on
hold off

%x2kIc = linspace(0.6,4.85,200);
x2kIc = linspace(0.6,5,200);
fit2kIc = polyfit(Experiment_2_2k.Vb(13:98),(Experiment_2_2k.Ic(13:98)),1);
line2kIc = (fit2kIc(1)*x2kIc + fit2kIc(2));
slope2kIc = fit2kIc(1);
intercept2kIc = (fit2kIc(2));

line2kIcEr = (fit2kIc(1)*Experiment_2_2k.Vb + fit2kIc(2));
error2kIc = mean(abs(Experiment_2_2k.Ic(20:end-20)-line2kIcEr(20:end-20))*100./Experiment_2_2k.Ic(20:end-20));

figure
plot(Experiment_2_2k.Vb,Experiment_2_2k.Ic,'b*')
hold on
plot(x2kIc,line2kIc,'r-')
title('Emitter-Degenerated Bipolar Collector Current Characteristics R = 2k \Omega')
xlabel('Base Voltage [V]')
ylabel('Collector Current [A]')
legend('Experimental R = 2k \Omega','Theoretical R = 2k \Omega','Location','Southeast')
grid on
hold off

%x20kIc = linspace(0.6,4.85,200);
x20kIc = linspace(0.6,5,200);
fit20kIc = polyfit(Experiment_2_20k.Vb(13:98),(Experiment_2_20k.Ic(13:98)),1);
line20kIc = (fit20kIc(1)*x20kIc + fit20kIc(2));
slope20kIc = fit20kIc(1);
intercept20kIc = (fit20kIc(2));

line20kIcEr = (fit20kIc(1)*Experiment_2_20k.Vb + fit20kIc(2));
error20kIc = mean(abs(Experiment_2_20k.Ic(20:end-20)-line20kIcEr(20:end-20))*100./Experiment_2_20k.Ic(20:end-20));

figure
plot(Experiment_2_20k.Vb,Experiment_2_20k.Ic,'b*')
hold on
plot(x20kIc,line20kIc,'r-')
title('Emitter-Degenerated Bipolar Collector Current Characteristics with R = 20k \Omega')
xlabel('Base Voltage [V]')
ylabel('Collector Current [A]')
legend('Experimental R = 20k \Omega','Theoretical R = 20k \Omega','Location','Southeast')
grid on
hold off

Theoretical_Beta = 150;

x200Rb = linspace(5e-9,1e-6,100);
fit200Rb = polyfit(log(Experiment_2_200.Ib(11:13)),log(Theoretical_Beta*200*(1 + U_T./(200*Theoretical_Beta*Experiment_2_200.Ib(11:13)))),1);
line200Rb = exp((fit200Rb(1))*log(x200Rb) + ((fit200Rb(2))));
slope200Rb = fit200Rb(1);
intercept200Rb = exp(fit200Rb(2));

x2kRb = linspace(3e-10,1e-6,100);
fit2kRb = polyfit(log(Experiment_2_2k.Ib(10:13)),log(Theoretical_Beta*2000*(1 + U_T./(2000*Theoretical_Beta*Experiment_2_2k.Ib(10:13)))),1);
line2kRb = exp((fit2kRb(1))*log(x2kRb) + ((fit2kRb(2))));
slope2kRb = fit2kRb(1);
intercept2kRb = exp(fit2kRb(2));

x20kRb = linspace(1e-9,5e-8,100);
fit20kRb = polyfit(log(Experiment_2_20k.Ib(9:11)),log(Theoretical_Beta*20000*(1 + U_T./(20000*Theoretical_Beta*Experiment_2_20k.Ib(9:11)))),1);
line20kRb = exp((fit20kRb(1))*log(x20kRb) + ((fit20kRb(2))));
slope20kRb = fit20kRb(1);
intercept20kRb = exp(fit20kRb(2));

% Rb for each resistor
figure
loglog(Experiment_2_200.Ib,Theoretical_Beta*200*(1 + U_T./(200*Theoretical_Beta*Experiment_2_200.Ib)),'g*')
hold on
loglog(x200Rb,line200Rb,'-k')
loglog(Experiment_2_2k.Ib,Theoretical_Beta*2000*(1 + U_T./(2000*Theoretical_Beta*Experiment_2_2k.Ib)),'m*')
loglog(x2kRb,line2kRb,'-c')
loglog(Experiment_2_20k.Ib,Theoretical_Beta*20000*(1 + U_T./(20000*Theoretical_Beta*Experiment_2_20k.Ib)),'b*')
loglog(x20kRb,line20kRb,'-r')
title('Incremental Base Resistance(R_{b}) of Degenerated Bipolar Transistor Terminals with R = 200 \Omega, R = 2 k\Omega, and R = 20 k\Omega')
xlabel('Base Current [A]')
ylabel('R_{b} [\Omega]')
legend('Incremental Base Resistance(R_{b}) with R = 200 \Omega','Theoretical Incremental Base Resistance(R_{b}) with R = 200 \Omega',...
    'Incremental Base Resistance(R_{b}) with R = 2k \Omega','Theoretical Incremental Base Resistance(R_{b} with R = 2k \Omega)',...
    'Incremental Base Resistance(R_{b}) with R = 20k \Omega','Theoretical Incremental Base Resistance(R_{b} with R = 20k \Omega)','Location','Southeast')
grid on
hold off

x200Gm = linspace(1e-9,1e-4,200);
fit200Gm = polyfit(log(Experiment_2_200.Ic(1:13)),log((1/200)*(1+((U_T/200)./Experiment_2_200.Ic(1:13)))),1);
line200Gm = exp((fit200Gm(1))*log(x200Gm) + ((fit200Gm(2))));
slope200Gm = fit200Gm(1);
intercept200Gm = exp(fit200Gm(2));

x2kGm = linspace(1e-9,1e-5,100);
fit2kGm  = polyfit(log(Experiment_2_2k.Ic(9:12)),log((1/2000)*(1+((U_T/2000)./Experiment_2_2k.Ic(9:12)))),1);
line2kGm  = exp((fit2kGm(1))*log(x2kGm)+((fit2kGm(2))));
slope2kGm  = fit2kGm(1);
intercept2kGm  = exp(fit2kGm(2));

x20kGm = linspace(5e-10,1e-6,100);
fit20kGm  = polyfit(log(Experiment_2_20k.Ic(8:11)),log((1/20000)*(1+((U_T/20000)./Experiment_2_20k.Ic(8:11)))),1);
line20kGm  = exp((fit20kGm(1))*log(x20kGm)+((fit20kGm(2))));
slope20kGm  = fit20kGm(1);
intercept20kGm  = exp(fit20kGm(2));

% Gm for each resistor
figure
loglog(Experiment_2_200.Ic,(1/200)*(1+((U_T/200)./Experiment_2_200.Ic)),'g*')
hold on
loglog(x200Gm,line200Gm,'-k')
loglog(Experiment_2_2k.Ic,(1/2000)*(1+((U_T/2000)./Experiment_2_2k.Ic)),'m*')
loglog(x2kGm,line2kGm,'-c')
loglog(Experiment_2_20k.Ic,(1/20000)*(1+((U_T/20000)./Experiment_2_20k.Ic)),'b*')
loglog(x20kGm,line20kGm,'-r')
title('Incremental Transconductance Gain (G_{m}) of Degenerated Bipolar Transistor with R = 200 \Omega, R = 2 k\Omega, and R = 20 k\Omega')
xlabel('Collector Current [A]')
ylabel('G_{m} [S]')
legend('Experimental Incremental Transconductance Gain (G_{m}) with R = 200 \Omega','Theoretical Incremental Transconductance Gain with R = 200 \Omega (G_{m})',...
    'Experimental Incremental Transconductance Gain (G_{m}) with R = 2 k\Omega','Theoretical Incremental Transconductance Gain (G_{m}) with R = 2 k\Omega',...
    'Experimental Incremental Transconductance Gain (G_{m}) with R = 20 k\Omega','Theoretical Incremental Transconductance Gain (G_{m}) with R = 20 k\Omega',...
    'Location','Northeast')
grid on
hold off

%% Experiment 3

%--
Experiment_1 = load('Experiment34_param.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ib = Experiment_1.Ib + 1.350e-09;
Experiment_1.Ie = (-1)*fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);
Experiment_1.Ic = Experiment_1.Ie - Experiment_1.Ib;
Theoretical_1.Vb = Experiment_1.Vb(16:37);
x = linspace(0.3, 0.8, 100);
fit = polyfit(Theoretical_1.Vb,log(Experiment_1.Ic(16:37)),1);
line = exp(fit(1) * x + fit(2));
U_T = 1/(fit(1));
I_s = exp(fit(2));
%--

Experiment_3 = load('Experiment_3-20k_3-2.mat');
Experiment_3.Ib = fliplr(Experiment_3.Ib);
Experiment_3.Vb = fliplr(Experiment_3.Vb);
Experiment_3.Ve = fliplr(Experiment_3.Ve);

x = linspace(0.5,5,200);
fit2 = polyfit(Experiment_3.Vb(11:end),Experiment_3.Ve(11:end),1);
line2 = fit2(1)*x + fit2(2);
slope2 = fit2(1);
intercept2 = fit2(2);

figure
plot(Experiment_3.Vb(1:2:end),Experiment_3.Ve(1:2:end),'b*')
hold on
plot(x, line2, 'r-');
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
title('Voltage Transfer Characteristics for Common-Collector Amplifier Circuit')
legend('Experimental V_{in} vs. V_{out}','Theoretical V_{in} vs. V_{out}','Location','Southeast')
%legend('Experimental R_1 = 51 k\Omega','Experimental R_1 = 60 k\Omega','Experimental R_1 = 71 k\Omega','Location','Northwest')
grid on
hold off



%% Experiment 4

%--
Experiment_1 = load('Experiment34_param.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ib = Experiment_1.Ib + 1.350e-09;
Experiment_1.Ie = (-1)*fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);
Experiment_1.Ic = Experiment_1.Ie - Experiment_1.Ib;
Theoretical_1.Vb = Experiment_1.Vb(16:37);
x = linspace(0.3, 0.8, 100);
fit = polyfit(Theoretical_1.Vb,log(Experiment_1.Ic(16:37)),1);
line = exp(fit(1) * x + fit(2));
U_T = 1/(fit(1));
I_s = exp(fit(2));
%--

Experiment_4_60k = load('Experiment_4-60k_NEW.mat');
Experiment_4_60k.Ib = fliplr(Experiment_4_60k.Ib);
Experiment_4_60k.Vb = fliplr(Experiment_4_60k.Vb);
Experiment_4_60k.Vout = fliplr(Experiment_4_60k.Vout);

x60 = linspace(0.56,1.87,200);
fit60 = polyfit(Experiment_4_60k.Vb(13:25),Experiment_4_60k.Vout(13:25),1);
line60 = fit60(1)*x60 + fit60(2);
slope60= fit60(1);
intercept60 = fit60(2);

x602 = linspace(1.87,5,200);
fit602 = polyfit(Experiment_4_60k.Vb(70:end),Experiment_4_60k.Vout(70:end),1);
line602 = fit602(1)*x602 + fit602(2); 
slope602 = fit602(1);
intercept602 = fit602(2);

Experiment_4_80k = load('Experiment_4-80k_NEW.mat');
Experiment_4_80k.Ib = fliplr(Experiment_4_80k.Ib);
Experiment_4_80k.Vb = fliplr(Experiment_4_80k.Vb);
Experiment_4_80k.Vout = fliplr(Experiment_4_80k.Vout);

x80 = linspace(0.56,1.6,200);
fit80 = polyfit(Experiment_4_80k.Vb(13:25),Experiment_4_80k.Vout(13:25),1);
line80 = fit80(1)*x80 + fit80(2);
slope80= fit80(1);
intercept80 = fit80(2);

x802 = linspace(1.6,5,200);
fit802 = polyfit(Experiment_4_80k.Vb(60:end),Experiment_4_80k.Vout(60:end),1);
line802 = fit802(1)*x802 + fit802(2); 
slope802 = fit802(1);
intercept802 = fit802(2);

Experiment_4_100k = load('Experiment_4-100k_NEW.mat');
Experiment_4_100k.Ib = fliplr(Experiment_4_100k.Ib);
Experiment_4_100k.Vb = fliplr(Experiment_4_100k.Vb);
Experiment_4_100k.Vout = fliplr(Experiment_4_100k.Vout);

x100 = linspace(0.56,1.45,200);
fit100 = polyfit(Experiment_4_100k.Vb(13:25),Experiment_4_100k.Vout(13:25),1);
line100 = fit100(1)*x100 + fit100(2);
slope100 = fit100(1);
intercept100 = fit100(2);

x1002 = linspace(1.45,5,200);
fit1002 = polyfit(Experiment_4_100k.Vb(70:end),Experiment_4_100k.Vout(70:end),1);
line1002 = fit1002(1)*x1002 + fit1002(2); 
slope1002 = fit1002(1);
intercept1002 = fit1002(2);

figure
plot(Experiment_4_60k.Vb,Experiment_4_60k.Vout,'g*')
hold on
plot(x60, line60, 'k-');
plot(x602, line602, 'k-');
plot(Experiment_4_80k.Vb,Experiment_4_80k.Vout,'m*')
plot(x80, line80, 'c-');
plot(x802, line802, 'c-');
plot(Experiment_4_100k.Vb,Experiment_4_100k.Vout,'b*')
plot(x100, line100, 'r-');
plot(x1002, line1002, 'r-');
plot(Experiment_3.Vb(1:2:end),Experiment_3.Ve(1:2:end),'y*')
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
title('Voltage Transfer Characteristics for Inverter Circuit')
legend('Experimental R_1 = 60.4 k\Omega','Theoretical Line of Best Fit for Mode 1 operation (R_1 = 60.4 k\Omega)'...
    ,'Theoretical Line of Best Fit for Mode 2 operation (R_1 = 60.4 k\Omega)','Experimental R_1 = 82.5 k\Omega',...
    'Theoretical Line of Best Fit for Mode 1 operation (R_1 = 82.5 k\Omega)',...
    'Theoretical Line of Best Fit for Mode 2 operation (R_1 = 82.5 k\Omega)','Experimental R_1 = 100 k\Omega',...
    'Theoretical Line of Best Fit for Mode 1 operation (R_1 = 100 k\Omega)',...
    'Theoretical Line of Best Fit for Mode 2 operation (R_1 = 100 k\Omega)',...
    'Emitter-Follower VTC from Experiment 3','Location','Southoutside','NumColumns',2)
grid on
hold off

