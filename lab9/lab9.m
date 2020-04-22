%% Experiment 1.

epsilon = 5e-4;
Vdd = 5;

MI.V2 = (importdata("Experiment 1 - Threshold.txt"));
SI.V2 = (importdata("Experiment 1 - SI.txt"));

MI.V2_2 = MI.V2(1:50000,:);
MI.V2_3 = MI.V2(50001:100000,:);
MI.V2_4 = MI.V2(100001:150000,:);

SI.V2_2 = SI.V2(1:50000,:);
SI.V2_3 = SI.V2(50001:100000,:);
SI.V2_4 = SI.V2(100001:150000,:);

figure()
plot(MI.V2_2(:,1),MI.V2_2(:,2),'r.')
hold on
grid on
plot(MI.V2_3(:,1),MI.V2_3(:,2),'b.')
plot(MI.V2_4(:,1),MI.V2_4(:,2),'k.')
title('Voltage Characteristics for a Current-Mirror Differential Amplifier for bias current just at threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off

figure()
plot(SI.V2_2(1:5:end,1),SI.V2_2(1:5:end,2),'r.')
hold on
grid on
plot(SI.V2_3(1:5:end,1),SI.V2_3(1:5:end,2),'b.')
plot(SI.V2_4(1:5:end,1),SI.V2_4(1:5:end,2),'k.')
title('Voltage Characteristics for a Current-Mirror Differential Amplifier for bias current above threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off

%% Experiment 2.

Exp2_MI.V2_2_5 = (importdata("Experiment 2 - Vdm Threshold V2 2_5.txt"));
Exp2_MI.Iin = (importdata("Experiment 2 - Iout Threshold Vcm 2_5.txt"));
Exp2_SI.V2_2_5 = (importdata("Experiment 2 - Vdm SI V2 2_5.txt"));
Exp2_SI.Iin = (importdata("Experiment 2 - Iout SI Vcm 2_5.txt"));

MI_V2_2_5_fit = polyfit(Exp2_MI.V2_2_5(1024:1070,1)-2.5,Exp2_MI.V2_2_5(1024:1070,2),1);
MI_V2_2_5_line = MI_V2_2_5_fit(1)*(Exp2_MI.V2_2_5(950:1200,1)-2.5) + MI_V2_2_5_fit(2);
MI_V2_2_5_slope = MI_V2_2_5_fit(1);

figure()
plot(Exp2_MI.V2_2_5(:,1)-2.5,Exp2_MI.V2_2_5(:,2),'b.')
hold on
grid on
plot(Exp2_MI.V2_2_5(950:1200,1)-2.5,MI_V2_2_5_line,'g')
axis([-25e-3 25e-3 0 5])
title('Voltage Characteristics for a Current-Mirror Differential Amplifier for bias current at threshold')
legend('Simulated Data','Line of Best Fit','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

% Fit
Exp2_MI.Iin(:,2) = -1 * Exp2_MI.Iin(:,2);
Exp2_MI.Iin_fit = polyfit(Exp2_MI.Iin(3576:46898,1),Exp2_MI.Iin(3576:46898,2),1);
Exp2_MI.Iin_line = Exp2_MI.Iin_fit(1)*(Exp2_MI.Iin(3400:45000,1)) + Exp2_MI.Iin_fit(2);
Exp2_MI.Iin_slope = Exp2_MI.Iin_fit(1);

figure()
plot(Exp2_MI.Iin(:,1),Exp2_MI.Iin(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Iin(3400:45000,1),Exp2_MI.Iin_line,'r-')
axis([0 5 -1e-8 2e-8])
title('Current Voltage Characteristics for a Current-Mirror Differential Amplifier, I_{b} in Medium Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

x_intercept = (-1*Exp2_MI.Iin_fit(2))/Exp2_MI.Iin_fit(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Above Threshold

SI_V2_2_5_fit = polyfit(Exp2_SI.V2_2_5(1000:1100,1)-2.5,Exp2_SI.V2_2_5(1000:1100,2),1);
SI_V2_2_5_line = SI_V2_2_5_fit(1)*(Exp2_SI.V2_2_5(950:1200,1)-2.5) + SI_V2_2_5_fit(2);
SI_V2_2_5_slope = SI_V2_2_5_fit(1);

figure()
plot(Exp2_SI.V2_2_5(:,1)-2.5,Exp2_SI.V2_2_5(:,2),'b.')
hold on
grid on
plot(Exp2_SI.V2_2_5(950:1200,1)-2.5,SI_V2_2_5_line,'g')
axis([-55e-3 55e-3 0 5])
title('Voltage Characteristics for a Current-Mirror Differential Amplifier for bias current above threshold')
legend('Simulated Data','Line of Best Fit','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

% Fit
Exp2_SI.Iin(:,2) = -1 * Exp2_SI.Iin(:,2);
Exp2_SI.Iin_fit = polyfit(Exp2_SI.Iin(7163:42340,1),Exp2_SI.Iin(7163:42340,2),1);
Exp2_SI.Iin_line = Exp2_SI.Iin_fit(1)*(Exp2_SI.Iin(7000:42000,1)) + Exp2_SI.Iin_fit(2);
Exp2_SI.Iin_slope = Exp2_SI.Iin_fit(1);

figure()
plot(Exp2_SI.Iin(6500:46000,1),Exp2_SI.Iin(6500:46000,2),'b.')
hold on
grid on
plot(Exp2_SI.Iin(7000:42000,1),Exp2_SI.Iin_line,'r-')
% axis([0 5 -1e-6 1e-6])
title('Current Voltage Characteristics for a Current-Mirror Differential Amplifier, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

%% Exp 2 - Leftover

Exp2_MI.Vdm_fit = polyfit(Exp2_MI.Vdm(47:52,1),Exp2_MI.Vdm(47:52,2),1);
Exp2_MI.Vdm_line = Exp2_MI.Vdm_fit(1)*(Exp2_MI.Vdm(45:57,1)) + Exp2_MI.Vdm_fit(2);
%Exp2_MI.Vdm_slope = (Exp2_MI.Vdm_line(end) - Exp2_MI.Vdm_line(1))/(Exp2_MI.Vdm(55,1)-Exp2_MI.Vdm(46,1));
Exp2_MI.Vdm_slope = Exp2_MI.Vdm_fit(1);

figure()
plot(Exp2_MI.Vdm(:,1)-2.5,Exp2_MI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Vdm(45:57,1)-2.5,Exp2_MI.Vdm_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off

Exp2_MI.R_out = 1/Exp2_MI.Vout_slope;
Exp2_MI.Gm = Exp2_MI.Vdm_slope;
Exp2_MI.Adm = Exp2_MI.R_out*Exp2_MI.Gm;
Exp2_MI.Adm_error = 100*(abs(Exp2_MI.Adm - MI_V2_2_5_slope)/MI_V2_2_5_slope);

%%%%%%%%% SI contd.
SI_x_intercept = (-1*Exp2_SI.Vout_fit(2))/Exp2_SI.Vout_fit(1);
Exp2_SI.Vdm_fit = polyfit(Exp2_SI.Vdm(40:65,1),Exp2_SI.Vdm(40:65,2),1);
Exp2_SI.Vdm_line = Exp2_SI.Vdm_fit(1)*(Exp2_SI.Vdm(35:70,1)) + Exp2_SI.Vdm_fit(2);
%Exp2_SI.Vdm_slope = (Exp2_SI.Vdm_line(end) - Exp2_SI.Vdm_line(1))/(Exp2_SI.Vdm(61,1)-Exp2_SI.Vdm(35,1));
Exp2_SI.Vdm_slope = Exp2_SI.Vdm_fit(1);

figure()
plot(Exp2_SI.Vdm(:,1)-2.5,Exp2_SI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_SI.Vdm(35:70,1)-2.5,Exp2_SI.Vdm_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off


Exp2_SI.R_out = 1/Exp2_SI.Vout_slope;
Exp2_SI.Gm = Exp2_SI.Vdm_slope;
Exp2_SI.Adm = Exp2_SI.R_out*Exp2_SI.Gm;
Exp2_SI.Adm_error = 100*(abs(Exp2_SI.Adm - SI_V2_2_5_slope)/SI_V2_2_5_slope);



%% Experiment 3 - Leftover

Exp3_MI = (importdata("Experiment3_Threshold.txt"));
Exp3_SI = (importdata("Experiment3_SI.txt"));

Exp3_MI_fit = polyfit(Exp3_MI(100:400,1),Exp3_MI(100:400,2),1);
Exp3_MI_line = Exp3_MI_fit(1)*(Exp3_MI(100:400,1)) + Exp3_MI_fit(2);
Exp3_MI_slope = (Exp3_MI_line(end) - Exp3_MI_line(1))/(Exp3_MI(400,1)-Exp3_MI(100,1));

figure
plot(Exp3_MI(1:5:end,1),Exp3_MI(1:5:end,2),'.')
hold on
grid on
plot(Exp3_MI(100:400,1),Exp3_MI_line,'r-')
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} at Threshold')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off

figure
plot(Exp3_MI(1:5:end,1),Exp3_MI(1:5:end,2)-Exp3_MI(1:5:end,1),'.')
hold on
grid on
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} at Threshold')
%legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off


% Above Threshold
Exp3_SI_fit = polyfit(Exp3_SI(100:400,1),Exp3_SI(100:400,2),1);
Exp3_SI_line = Exp3_SI_fit(1)*(Exp3_SI(100:400,1)) + Exp3_SI_fit(2);
Exp3_SI_slope = (Exp3_SI_line(end) - Exp3_SI_line(1))/(Exp3_SI(400,1)-Exp3_SI(100,1));

figure
plot(Exp3_SI(1:5:end,1),Exp3_SI(1:5:end,2),'.')
hold on
grid on
plot(Exp3_SI(100:400,1),Exp3_SI_line,'r-')
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off

figure
plot(Exp3_SI(1:5:end,1),Exp3_SI(1:5:end,2)-Exp3_SI(1:5:end,1),'.')
hold on
grid on
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} in Strong Inversion')
%legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off
