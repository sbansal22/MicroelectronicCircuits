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
Exp2_MI.Vdm = (importdata("Experiment 2 - Iout Threshold Vdm 2_5 Vout 0_5970.txt"));
Exp2_SI.V2_2_5 = (importdata("Experiment 2 - Vdm SI V2 2_5.txt"));
Exp2_SI.Iin = (importdata("Experiment 2 - Iout SI Vcm 2_5.txt"));
Exp2_SI.Vdm = (importdata("Experiment 2 - Iout SI Vdm 2_5 Vout 0_9041.txt"));

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
Exp2_MI.Iin_fit = polyfit(Exp2_MI.Iin(3001:13001,1),Exp2_MI.Iin(3001:13001,2),1);
Exp2_MI.Iin_line = Exp2_MI.Iin_fit(1)*(Exp2_MI.Iin(:,1)) + Exp2_MI.Iin_fit(2);
Exp2_MI.Iin_slope = Exp2_MI.Iin_fit(1);

figure()
plot(Exp2_MI.Iin(:,1),Exp2_MI.Iin(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Iin(:,1),Exp2_MI.Iin_line,'r-')
axis([0 5 -1e-8 2e-8])
title('Current Voltage Characteristics for a Current-Mirror Differential Amplifier, I_{b} in Medium Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

Exp2_MI.Iin_x_intercept = (-1*Exp2_MI.Iin_fit(2))/Exp2_MI.Iin_fit(1);

% Vout
Exp2_MI.Vdm_fit = polyfit(Exp2_MI.Vdm(2855:3147,1),Exp2_MI.Vdm(2855:3147,2),1);
Exp2_MI.Vdm_line = Exp2_MI.Vdm_fit(1)*(Exp2_MI.Vdm(:,1)) + Exp2_MI.Vdm_fit(2);
%Exp2_MI.Vdm_slope = (Exp2_MI.Vdm_line(end) - Exp2_MI.Vdm_line(1))/(Exp2_MI.Vdm(55,1)-Exp2_MI.Vdm(46,1));
Exp2_MI.Vdm_slope = Exp2_MI.Vdm_fit(1);

figure()
plot(Exp2_MI.Vdm(:,1)-2.5,Exp2_MI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Vdm(:,1)-2.5,Exp2_MI.Vdm_line,'r-')
axis([-0.3 0.3 -1.3e-7 1.3e-7])
title('Current Voltage Characteristics for Current-Mirror Differential Amplifier')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off

Exp2_MI.R_out = 1/Exp2_MI.Iin_slope;
Exp2_MI.Gm = Exp2_MI.Vdm_slope;
Exp2_MI.Adm = Exp2_MI.R_out*Exp2_MI.Gm;
Exp2_MI.Adm_error = 100*(abs(Exp2_MI.Adm - MI_V2_2_5_slope)/MI_V2_2_5_slope);


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
Exp2_SI.Iin_fit = polyfit(Exp2_SI.Iin(5001:15001,1),Exp2_SI.Iin(5001:15001,2),1);
Exp2_SI.Iin_line = Exp2_SI.Iin_fit(1)*(Exp2_SI.Iin(:,1)) + Exp2_SI.Iin_fit(2);
Exp2_SI.Iin_slope = Exp2_SI.Iin_fit(1);

figure()
plot(Exp2_SI.Iin(:,1),Exp2_SI.Iin(:,2),'b.')
hold on
grid on
plot(Exp2_SI.Iin(:,1),Exp2_SI.Iin_line,'r-')
axis([0 5 -2e-7 6e-7])
title('Current Voltage Characteristics for a Current-Mirror Differential Amplifier, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

Exp2_SI.Iin_x_intercept = (-1*Exp2_SI.Iin_fit(2))/Exp2_SI.Iin_fit(1);

Exp2_SI.Vdm_fit = polyfit(Exp2_SI.Vdm(7952:8051,1),Exp2_SI.Vdm(7952:8051,2),1);
Exp2_SI.Vdm_line = Exp2_SI.Vdm_fit(1)*(Exp2_SI.Vdm(:,1)) + Exp2_SI.Vdm_fit(2);
%Exp2_SI.Vdm_slope = (Exp2_SI.Vdm_line(end) - Exp2_SI.Vdm_line(1))/(Exp2_SI.Vdm(61,1)-Exp2_SI.Vdm(35,1));
Exp2_SI.Vdm_slope = Exp2_SI.Vdm_fit(1);

figure()
plot(Exp2_SI.Vdm(:,1)-2.5,Exp2_SI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_SI.Vdm(:,1)-2.5,Exp2_SI.Vdm_line,'r-')
axis([-0.6 0.6 -6e-6 6e-6])
title('Current Voltage Characteristics for the Current-Mirror Differential Amplifier, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off

Exp2_SI.R_out = 1/Exp2_SI.Iin_slope;
Exp2_SI.Gm = Exp2_SI.Vdm_slope;
Exp2_SI.Adm = Exp2_SI.R_out*Exp2_SI.Gm;
Exp2_SI.Adm_error = 100*(abs(Exp2_SI.Adm - SI_V2_2_5_slope)/SI_V2_2_5_slope);


%% Experiment 3.

Exp3_MI_P1 = (importdata("Experiment 3 - Threshold Part 1.txt"));
Exp3_MI_P2 = (importdata("Experiment 3 - Threshold Part 2.txt"));
Exp3_SI_P1 = (importdata("Experiment 3 - Strong Inversion Part 1.txt"));
Exp3_SI_P2 = (importdata("Experiment 3 - Strong Inversion Part 2.txt"));

figure()
plot(Exp3_MI_P1(:,1),Exp3_MI_P1(:,2),'b.')
hold on
grid on
plot(Exp3_MI_P1(:,1),Exp3_MI_P1(:,3),'r.')
title('Unity-Gain Follower Step Response, I_{b} in Moderate Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off

figure()
plot(Exp3_MI_P2(:,1),Exp3_MI_P2(:,2),'b.')
hold on
grid on
plot(Exp3_MI_P2(1:3:end,1),Exp3_MI_P2(1:3:end,3),'r.')
title('Unity-Gain Follower Step Response with Slewing, I_{b} in Moderate Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off

%%%%%%%%%%%% ABOVE THRESHOLD

figure()
plot(Exp3_SI_P1(:,1),Exp3_SI_P1(:,2),'b.')
hold on
grid on
plot(Exp3_SI_P1(:,1),Exp3_SI_P1(:,3),'r.')
title('Unity-Gain Follower Step Response, I_{b} in Strong Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off

figure()
plot(Exp3_SI_P2(:,1),Exp3_SI_P2(:,2),'b.')
hold on
grid on
plot(Exp3_SI_P2(1:end,1),Exp3_SI_P2(1:end,3),'r.')
title('Unity-Gain Follower Step Response with Slewing, I_{b} in Strong Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off


%% Experiment 3 - trial

Exp3_MI_P1 = (importdata("Experiment 3 - Threshold Part 1.txt"));
Exp3_MI_P2 = (importdata("Experiment 3 - Threshold Part 2.txt"));
Exp3_SI_P1 = (importdata("Experiment 3 - Strong Inversion Part 1.txt"));
Exp3_SI_P2 = (importdata("Experiment 3 - Strong Inversion Part 2.txt"));

semilogy(Exp3_MI_P1(40:150,1),Exp3_MI_P1(40:150,3)-max(Exp3_MI_P1(40:150,3)),'k.')
hold on
Exp3_MI_tau_up_fit = polyfit(Exp3_MI_P1(40:90,1),log(Exp3_MI_P1(40:90,3)-max(Exp3_MI_P1(40:149,3))),1);
Exp3_MI_tau_up_line = exp(Exp3_MI_tau_up_fit(1)*(Exp3_MI_P1(40:90,1)) + Exp3_MI_tau_up_fit(2));
Exp3_MI_slope_up = Exp3_MI_tau_up_fit(1);
plot(Exp3_MI_P1(40:90,1),Exp3_MI_tau_up_line,'g')
hold off
tau_up = real(1/Exp3_MI_slope_up)

semilogy(Exp3_MI_P1(160:end-50,1),Exp3_MI_P1(160:end-50,3)-min(Exp3_MI_P1(160:end-50,3)),'k.')
hold on
Exp3_MI_tau_down_fit = polyfit(Exp3_MI_P1(160:end-100,1),log(Exp3_MI_P1(160:end-100,3)-min(Exp3_MI_P1(160:end-50,3))),1);
Exp3_MI_tau_down_line = exp(Exp3_MI_tau_down_fit(1)*(Exp3_MI_P1(160:end-100,1)) + Exp3_MI_tau_down_fit(2));
Exp3_MI_slope_down = Exp3_MI_tau_down_fit(1);
plot(Exp3_MI_P1(160:end-100,1),Exp3_MI_tau_down_line,'g')
hold off
tau_down = real(1/Exp3_MI_slope_down)



%%
figure()
%plot(Exp3_MI_P1(160:end-50,1),(Exp3_MI_P1(160:end-50,2)-Exp3_MI_P1(160:end-50,3))./(diff(Exp3_MI_P1(159:end-50,3))./(diff(Exp3_MI_P1(159:end-50,1)))),'r.')
hold on
%plot(Exp3_MI_P1(40:150,1),(Exp3_MI_P1(40:150,2)-Exp3_MI_P1(40:150,3))./(diff(Exp3_MI_P1(39:150,3))./(diff(Exp3_MI_P1(39:150,1)))),'b.')
plot(Exp3_MI_P1(1:end-1,1),(Exp3_MI_P1(1:end-1,2)-Exp3_MI_P1(1:end-1,3))./(diff(Exp3_MI_P1(1:end,3))./(diff(Exp3_MI_P1(1:end,1)))),'k.')
xlabel('Time [s]')
ylabel('\tau [s^{-1}]')
title('\tau with Respect to Time')
grid on
hold off

Exp3_MI_P1_tau = (Exp3_MI_P1(1:end-1,2)-Exp3_MI_P1(1:end-1,3))./(diff(Exp3_MI_P1(1:end,3))./(diff(Exp3_MI_P1(1:end,1))));
Exp3_MI_P1_tau_up = mean(tau(27:40));
Exp3_MI_P1_tau_down = mean(tau(160:190));
%%
Exp3_MI_P2_slew_up_fit = polyfit(Exp3_MI_P2(95:395,1),Exp3_MI_P2(95:395,3),1);
Exp3_MI_P2_slew_up_line = Exp3_MI_P2_slew_up_fit(1)*(Exp3_MI_P2(95:395,1)) + Exp3_MI_P2_slew_up_fit(2);
%Exp3_MI_slope = (Exp3_MI_line(end) - Exp3_MI_line(1))/(Exp3_MI(400,1)-Exp3_MI(100,1));
Exp3_MI_P2_slew_up_slope = Exp3_MI_P2_slew_up_fit(1);

Exp3_MI_P2_slew_down_fit = polyfit(Exp3_MI_P2(654:922,1),Exp3_MI_P2(654:922,3),1);
Exp3_MI_P2_slew_down_line = Exp3_MI_P2_slew_down_fit(1)*(Exp3_MI_P2(654:922,1)) + Exp3_MI_P2_slew_down_fit(2);
%Exp3_MI_slope = (Exp3_MI_line(end) - Exp3_MI_line(1))/(Exp3_MI(400,1)-Exp3_MI(100,1));
Exp3_MI_P2_slew_down_slope = Exp3_MI_P2_slew_down_fit(1);


figure()
plot(Exp3_MI_P2(:,1),Exp3_MI_P2(:,2),'b.')
hold on
grid on
plot(Exp3_MI_P2(1:3:end,1),Exp3_MI_P2(1:3:end,3),'r.')
plot(Exp3_MI_P2(95:395,1),Exp3_MI_P2_slew_up_line,'g')
plot(Exp3_MI_P2(654:922,1),Exp3_MI_P2_slew_down_line,'m')
title('Unity-Gain Follower Step Response with Slewing, I_{b} in Moderate Inversion')
legend('V_{in} [V]','V_{out} [V]','Slew Fit Up-Going','Slew Fit Down-Going','Location','Northeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off
%%

%%%%%%%%%%%% ABOVE THRESHOLD

figure()
plot(Exp3_SI_P1(:,1),Exp3_SI_P1(:,2),'b.')
hold on
grid on
plot(Exp3_SI_P1(:,1),Exp3_SI_P1(:,3),'r.')
title('Unity-Gain Follower Step Response, I_{b} in Strong Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off

figure()
plot(Exp3_SI_P2(:,1),Exp3_SI_P2(:,2),'b.')
hold on
grid on
plot(Exp3_SI_P2(1:end,1),Exp3_SI_P2(1:end,3),'r.')
title('Unity-Gain Follower Step Response with Slewing, I_{b} in Strong Inversion')
legend('V_{in} [V]','V_{out} [V]','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Voltage [V]')
hold off

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
