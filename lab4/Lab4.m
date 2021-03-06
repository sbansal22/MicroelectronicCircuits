%% Experiment 1
Exp_Q1 = load('Exp1_Q1.mat');
Exp_Q1.I_b = fliplr(Exp_Q1.I_b);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_Q1.I_e = (-1)*fliplr(Exp_Q1.I_e);
Exp_Q1.V_b = fliplr(Exp_Q1.V_in);
Exp_Q1.I_c = Exp_Q1.I_e - Exp_Q1.I_b;

Exp_Q2 = load('Exp1_Q2.mat');
Exp_Q2.I_b = fliplr(Exp_Q2.I_b);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_Q2.I_e = (-1)*fliplr(Exp_Q2.I_e);
Exp_Q2.V_b = fliplr(Exp_Q2.V_in);
Exp_Q2.I_c = Exp_Q2.I_e - Exp_Q2.I_b;

Exp_Q3 = load('Exp1_Q3.mat');
Exp_Q3.I_b = fliplr(Exp_Q3.I_b);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_Q3.I_e = (-1)*fliplr(Exp_Q3.I_e);
Exp_Q3.V_b = fliplr(Exp_Q3.V_in);
Exp_Q3.I_c = Exp_Q3.I_e - Exp_Q3.I_b;

Exp_Q4 = load('Exp1_Q4.mat');
Exp_Q4.I_b = fliplr(Exp_Q4.I_b);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_Q4.I_e = (-1)*fliplr(Exp_Q4.I_e);
Exp_Q4.V_b = fliplr(Exp_Q4.V_in);
Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

% Transistor 1
Theoretical_1.V_b = Exp_Q1.V_b(34:89);
x = linspace(0.3, 0.8, 100);
fit = polyfit(Theoretical_1.V_b,log(Exp_Q1.I_c(34:89)),1);
line = exp(fit(1) * x + fit(2));
Q1_U_T = 1/(fit(1));
Q1_I_s = exp(fit(2));

% Transistor 2
Theoretical_2.V_b = Exp_Q2.V_b(34:89);
fit = polyfit(Theoretical_2.V_b,log(Exp_Q2.I_c(34:89)),1);
line = exp(fit(1) * x + fit(2));
Q2_U_T = 1/(fit(1));
Q2_I_s = exp(fit(2));

% Transistor 3
Theoretical_3.V_b = Exp_Q3.V_b(34:89);
fit = polyfit(Theoretical_3.V_b,log(Exp_Q3.I_c(34:89)),1);
line = exp(fit(1) * x + fit(2));
Q3_U_T = 1/(fit(1));
Q3_I_s = exp(fit(2));

% Transistor 4
Theoretical_4.V_b = Exp_Q4.V_b(34:89);
fit = polyfit(Theoretical_4.V_b,log(Exp_Q4.I_c(34:89)),1);
line = exp(fit(1) * x + fit(2));
Q4_U_T = 1/(fit(1));
Q4_I_s = exp(fit(2));


figure
semilogy(Exp_Q1.V_b,Exp_Q1.I_c,'r*')
hold on
semilogy(Exp_Q2.V_b,Exp_Q2.I_c,'g*')
semilogy(Exp_Q3.V_b,Exp_Q3.I_c,'b*')
semilogy(Exp_Q4.V_b,Exp_Q4.I_c,'k*')
%semilogy(Experiment_1.Vb,Experiment_1.Ib,'m*')
%semilogy(Experiment_1.Vb,Theoretical_1.Ic,'r-')
%semilogy(Experiment_1.Vb,Theoretical_1.Ib,'g-')
title('Experimental I-V Characteristic of a Bipolar Transistor Terminals')
xlabel('Base Voltage [V]')
ylabel('Current [A]')
legend('Experimental I-V Characteristic of Transistor 1 (Pins 1,2,15,16)',...
    'Experimental I-V Characteristic of Transistor 2 (Pins 3,4,13,14)',...
    'Experimental I-V Characteristic of Transistor 3 (Pins 5,6,11,12)',...
    'Experimental I-V Characteristic of Transistor 4 (Pins 7,8,9,10)',...
    'Location','Southeast')
grid on
hold off

% Percentage difference calculations
MeanI_c = (Exp_Q1.I_c + Exp_Q2.I_c + Exp_Q3.I_c + Exp_Q4.I_c)/4;
DiffQ1I_c = abs(Exp_Q1.I_c - MeanI_c)*100./Exp_Q1.I_c; 
DiffQ2I_c = abs(Exp_Q2.I_c - MeanI_c)*100./Exp_Q2.I_c; 
DiffQ3I_c = abs(Exp_Q3.I_c - MeanI_c)*100./Exp_Q3.I_c; 
DiffQ4I_c = abs(Exp_Q4.I_c - MeanI_c)*100./Exp_Q4.I_c; 

figure
plot(Exp_Q1.V_b,DiffQ1I_c,'r*')
hold on
plot(Exp_Q2.V_b,DiffQ2I_c,'g*')
plot(Exp_Q3.V_b,DiffQ3I_c,'b*')
plot(Exp_Q4.V_b,DiffQ4I_c,'k*')
%semilogy(Experiment_1.Vb,Experiment_1.Ib,'m*')
%semilogy(Experiment_1.Vb,Theoretical_1.Ic,'r-')
%semilogy(Experiment_1.Vb,Theoretical_1.Ib,'g-')
title('Percentage difference between each transistorís collector current and the mean value of all four collector currents as a function of base voltage')
xlabel('Base Voltage [V]')
ylabel('Percentage Difference [%]')
legend('Percentage difference for Q1 Collector Current',...
    'Percentage difference for Q2 Collector Current',...
    'Percentage difference for Q3 Collector Current',...
    'Percentage difference for Q4 Collector Current',...
    'Location','Southeast')
grid on
hold off

figure
semilogx(Exp_Q1.I_b,Exp_Q1.I_c./Exp_Q1.I_b,'r*')
hold on
semilogx(Exp_Q2.I_b,Exp_Q2.I_c./Exp_Q2.I_b,'g*')
semilogx(Exp_Q3.I_b,Exp_Q3.I_c./Exp_Q3.I_b,'b*')
semilogx(Exp_Q4.I_b,Exp_Q4.I_c./Exp_Q4.I_b,'k*')
title('\beta Forward Current Gain')
xlabel('Base Current [A]')
ylabel('\beta')
axis([10e-10 10e-3 0 200])
legend('Experimental \beta of Transistor 1 (Pins 1,2,15,16)',...
    'Experimental \beta of Transistor 2 (Pins 3,4,13,14)',...
    'Experimental \beta of Transistor 3 (Pins 5,6,11,12)',...
    'Experimental \beta of Transistor 4 (Pins 7,8,9,10)',...
    'Location','Southeast')
grid on
hold off

Q1_beta = Exp_Q1.I_c./Exp_Q1.I_b;
Q1_beta = mean(Q1_beta(62:90))
Q2_beta = Exp_Q2.I_c./Exp_Q2.I_b;
Q2_beta = mean(Q2_beta(62:90))
Q3_beta = Exp_Q3.I_c./Exp_Q3.I_b;
Q3_beta = mean(Q3_beta(62:90))
Q4_beta = Exp_Q4.I_c./Exp_Q4.I_b;
Q4_beta = mean(Q4_beta(62:90))
%% Experiment 2
% Part A
Exp_2a_2k = load('Exp_2a_2k.mat');
Exp_2a_2k.Ix = fliplr(Exp_2a_2k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2a_2k.Iz = (-1)*fliplr(Exp_2a_2k.Iz);
Exp_2a_2k.Vx = fliplr(Exp_2a_2k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2a_20k = load('Exp_2a_20k.mat');
Exp_2a_20k.Ix = fliplr(Exp_2a_20k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2a_20k.Iz = (-1)*fliplr(Exp_2a_20k.Iz);
Exp_2a_20k.Vx = fliplr(Exp_2a_20k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2a_200k = load('Exp_2a_200k.mat');
Exp_2a_200k.Ix = fliplr(Exp_2a_200k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2a_200k.Iz = (-1)*fliplr(Exp_2a_200k.Iz);
Exp_2a_200k.Vx = fliplr(Exp_2a_200k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2a_2M = load('Exp_2a_2M-2.mat');
Exp_2a_2M.Ix = fliplr(Exp_2a_2M.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2a_2M.Iz = (-1)*fliplr(Exp_2a_2M.Iz);
Exp_2a_2M.Vx = fliplr(Exp_2a_2M.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

% THEORETICAL
V_div = 0.247;
Iy_2k = V_div/2000;
Iy_20k = V_div/20000;
Iy_200k = V_div/200000;
Iy_2M = V_div/2000000;

Iz_2k_theo = sqrt(Exp_2a_2k.Ix*Iy_2k);
Iz_20k_theo = sqrt(Exp_2a_20k.Ix*Iy_20k);
Iz_200k_theo = sqrt(Exp_2a_200k.Ix*Iy_200k);
Iz_2M_theo = sqrt(Exp_2a_2M.Ix*Iy_2M);

figure
loglog(Exp_2a_2k.Ix,Exp_2a_2k.Iz,'g*')
hold on
loglog(Exp_2a_20k.Ix,Exp_2a_20k.Iz,'b*')
loglog(Exp_2a_200k.Ix,Exp_2a_200k.Iz,'r*')
loglog(Exp_2a_2M.Ix,Exp_2a_2M.Iz,'k*')
loglog(Exp_2a_2k.Ix,Iz_2k_theo)
loglog(Exp_2a_20k.Ix,Iz_20k_theo)
loglog(Exp_2a_200k.Ix,Iz_200k_theo)
loglog(Exp_2a_2M.Ix,Iz_2M_theo)
title('Output Current for Translinear Circuit 1 (I_{z} as a function of I_{x})')
xlabel('I_{x} [A]')
ylabel('I_{z} [A]')
legend('I_{y} controlled by 2 k\Omega','I_{y} controlled by 20 k\Omega',...
    'I_{y} controlled by 200 k\Omega','I_{y} controlled by 2 M\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 2 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 20 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 200 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 2 M\Omega'...
    ,'Location','Southeast')
grid on
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part B
Exp_2b_2k = load('Exp_2b_2k.mat');
Exp_2b_2k.Iy = (-1)*fliplr(Exp_2b_2k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2b_2k.Iz = (-1)*fliplr(Exp_2b_2k.Iz);
Exp_2b_2k.Vy = fliplr(Exp_2b_2k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2b_20k = load('Exp_2b_20k.mat');
Exp_2b_20k.Iy = (-1)*fliplr(Exp_2b_20k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2b_20k.Iz = (-1)*fliplr(Exp_2b_20k.Iz);
Exp_2b_20k.Vy = fliplr(Exp_2b_20k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2b_200k = load('Exp_2b_200k.mat');
Exp_2b_200k.Iy = (-1)*fliplr(Exp_2b_200k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2b_200k.Iz = (-1)*fliplr(Exp_2b_200k.Iz);
Exp_2b_200k.Vy = fliplr(Exp_2b_200k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_2b_2M = load('Exp_2b_2M.mat');
Exp_2b_2M.Iy = (-1)*fliplr(Exp_2b_2M.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_2b_2M.Iz = (-1)*fliplr(Exp_2b_2M.Iz);
Exp_2b_2M.Vy = fliplr(Exp_2b_2M.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

% THEORETICAL
V_div = 1.8711;
Ix_2k = (5-V_div)/2000;
Ix_20k = (5-V_div)/20000;
Ix_200k = (5-V_div)/200000;
Ix_2M = (5-V_div)/2000000;

Iz_2k_theo = sqrt(Exp_2b_2k.Iy*Ix_2k);
Iz_20k_theo = sqrt(Exp_2b_20k.Iy*Ix_20k);
Iz_200k_theo = sqrt(Exp_2b_200k.Iy*Ix_200k);
Iz_2M_theo = sqrt(Exp_2b_2M.Iy*Ix_2M);

figure
loglog(Exp_2b_2k.Iy,Exp_2b_2k.Iz,'g*')
hold on
loglog(Exp_2b_20k.Iy,Exp_2b_20k.Iz,'b*')
loglog(Exp_2b_200k.Iy,Exp_2b_200k.Iz,'r*')
loglog(Exp_2b_2M.Iy,Exp_2b_2M.Iz,'k*')
loglog(Exp_2b_2k.Iy,Iz_2k_theo)
loglog(Exp_2b_20k.Iy,Iz_20k_theo)
loglog(Exp_2b_200k.Iy,Iz_200k_theo)
loglog(Exp_2b_2M.Iy,Iz_2M_theo)
title('Output Current for Translinear Circuit 1 (I_{z} as a function of I_{y})')
xlabel('I_{y} [A]')
ylabel('I_{z} [A]')
legend('I_{x} controlled by 2 k\Omega','I_{x} controlled by 20 k\Omega',...
    'I_{x} controlled by 200 k\Omega','I_{x} controlled by 2 M\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 2 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 20 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 200 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 2 M\Omega'...
    ,'Location','Southeast')
grid on
hold off


%% Experiment 3
% Part A
Exp_3a_2k = load('Exp_3a_2k.mat');
Exp_3a_2k.Ix = fliplr(Exp_3a_2k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3a_2k.Iz = (-1)*fliplr(Exp_3a_2k.Iz);
Exp_3a_2k.Vx = fliplr(Exp_3a_2k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3a_20k = load('Exp_3a_20k.mat');
Exp_3a_20k.Ix = fliplr(Exp_3a_20k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3a_20k.Iz = (-1)*fliplr(Exp_3a_20k.Iz);
Exp_3a_20k.Vx = fliplr(Exp_3a_20k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3a_200k = load('Exp_3a_200k.mat');
Exp_3a_200k.Ix = fliplr(Exp_3a_200k.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3a_200k.Iz = (-1)*fliplr(Exp_3a_200k.Iz);
Exp_3a_200k.Vx = fliplr(Exp_3a_200k.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3a_2M = load('Exp_3a_2M.mat');
Exp_3a_2M.Ix = fliplr(Exp_3a_2M.Ix);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3a_2M.Iz = (-1)*fliplr(Exp_3a_2M.Iz);
Exp_3a_2M.Vx = fliplr(Exp_3a_2M.Vx);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

% THEORETICAL
V_div = 0.247;
Iy_2k = V_div/2000;
Iy_20k = V_div/20000;
Iy_200k = V_div/200000;
Iy_2M = V_div/2000000;

Iz_2k_theo = (Exp_3a_2k.Ix.^2)/Iy_2k;
Iz_20k_theo = (Exp_3a_20k.Ix.^2)/Iy_20k;
Iz_200k_theo = (Exp_3a_200k.Ix.^2)/Iy_200k;
Iz_2M_theo = (Exp_3a_2M.Ix.^2)/Iy_2M;

figure
loglog(Exp_3a_2k.Ix,Exp_3a_2k.Iz,'g*')
hold on
loglog(Exp_3a_20k.Ix,Exp_3a_20k.Iz,'b*')
loglog(Exp_3a_200k.Ix,Exp_3a_200k.Iz,'r*')
loglog(Exp_3a_2M.Ix,Exp_3a_2M.Iz,'k*')
loglog(Exp_3a_2k.Ix,Iz_2k_theo)
loglog(Exp_3a_20k.Ix,Iz_20k_theo)
loglog(Exp_3a_200k.Ix,Iz_200k_theo)
loglog(Exp_3a_2M.Ix,Iz_2M_theo)
title('Output Current for Translinear Circuit 1 (I_{z} as a function of I_{x})')
xlabel('I_{x} [A]')
ylabel('I_{z} [A]')
legend('I_{y} controlled by 2 k\Omega','I_{y} controlled by 20 k\Omega',...
    'I_{y} controlled by 200 k\Omega','I_{y} controlled by 2 M\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 2 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 20 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 200 k\Omega',...
    'Theoretical I_{z} as a function of I_{x} with I_{y} controlled by 2 M\Omega'...
    ,'Location','Southeast')
grid on
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part B
Exp_3b_2k = load('Exp_3b_2k.mat');
Exp_3b_2k.Iy = (-1)*fliplr(Exp_3b_2k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3b_2k.Iz = (-1)*fliplr(Exp_3b_2k.Iz);
Exp_3b_2k.Vy = fliplr(Exp_3b_2k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3b_20k = load('Exp_3b_20k.mat');
Exp_3b_20k.Iy = (-1)*fliplr(Exp_3b_20k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3b_20k.Iz = (-1)*fliplr(Exp_3b_20k.Iz);
Exp_3b_20k.Vy = fliplr(Exp_3b_20k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3b_200k = load('Exp_3b_200k.mat');
Exp_3b_200k.Iy = (-1)*fliplr(Exp_3b_200k.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3b_200k.Iz = (-1)*fliplr(Exp_3b_200k.Iz);
Exp_3b_200k.Vy = fliplr(Exp_3b_200k.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

Exp_3b_2M = load('Exp_3b_2M.mat');
Exp_3b_2M.Iy = (-1)*fliplr(Exp_3b_2M.Iy);
%Exp_Q1.Ib = Exp_Q1.Ib + 1.350e-09;
Exp_3b_2M.Iz = (-1)*fliplr(Exp_3b_2M.Iz);
Exp_3b_2M.Vy = fliplr(Exp_3b_2M.Vy);
%Exp_Q4.I_c = Exp_Q4.I_e - Exp_Q4.I_b;

% THEORETICAL
V_div = 1.8711;
Ix_2k = (5-V_div)/2000;
Ix_20k = (5-V_div)/20000;
Ix_200k = (5-V_div)/200000;
Ix_2M = (5-V_div)/2000000;


Iz_2k_theo = ((Ix_2k^2)./Exp_3b_2k.Iy);
Iz_20k_theo = ((Ix_20k^2)./Exp_3b_20k.Iy);
Iz_200k_theo = ((Ix_200k^2)./Exp_3b_200k.Iy);
Iz_2M_theo = ((Ix_2M^2)./Exp_3b_2M.Iy);

figure
loglog(Exp_3b_2k.Iy,Exp_3b_2k.Iz,'g*')
hold on
loglog(Exp_3b_20k.Iy,Exp_3b_20k.Iz,'b*')
loglog(Exp_3b_200k.Iy,Exp_3b_200k.Iz,'r*')
loglog(Exp_3b_2M.Iy,Exp_3b_2M.Iz,'k*')
loglog(Exp_3b_2k.Iy,Iz_2k_theo)
loglog(Exp_3b_20k.Iy,Iz_20k_theo)
loglog(Exp_3b_200k.Iy,Iz_200k_theo)
loglog(Exp_3b_2M.Iy,Iz_2M_theo)
title('Output Current for Translinear Circuit 1 (I_{z} as a function of I_{y})')
xlabel('I_{y} [A]')
ylabel('I_{z} [A]')
legend('I_{x} controlled by 2 k\Omega','I_{x} controlled by 20 k\Omega',...
    'I_{x} controlled by 200 k\Omega','I_{x} controlled by 2 M\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 2 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 20 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 200 k\Omega',...
    'Theoretical I_{z} as a function of I_{y} with I_{x} controlled by 2 M\Omega'...
    ,'Location','Southoutside')
grid on
hold off