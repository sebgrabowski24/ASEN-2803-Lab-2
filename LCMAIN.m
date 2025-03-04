%{
Authors: Lucas Nussbaumer, Chase Wyngarden
Assignment: Lab 2
Creation Date: Febuary 18, 2025
Inputs: Test1_ (10.5 volt - 5.5 volt)
Outputs: 
Purpose: Analyze general planar motion, Practice using kinematical 
descriptions of a physical system Investigate discrepancies between a model 
and a physical systes, Assess experimental results
%}


%% Housekeeping

clc
clear
close all


%% Get all Data Files Cleaned

[~, ~, ~, ~, Data_10pt5V] = LCSDATA(readtable("Data Files/Test1_10pt5V"));
[~, ~, ~, ~, Data_9pt5V] = LCSDATA(readtable("Data Files/Test1_9pt5V"));
[~, ~, ~, ~, Data_8pt5V] = LCSDATA(readtable("Data Files/Test1_8pt5V"));
[~, ~, ~, ~, Data_7pt5V] = LCSDATA(readtable("Data Files/Test1_7pt5V"));
[~, ~, ~, ~, Data_6pt5V] = LCSDATA(readtable("Data Files/Test1_6pt5V"));


%% Plot
r =7.62;
l = 25.4;
d =17.145;
w.tenpt5=mean(Data_10pt5V.w_exp);
w.ninept5=mean(Data_9pt5V.w_exp);
w.eightpt5=mean(Data_8pt5V.w_exp);
w.sevenpt5=mean(Data_7pt5V.w_exp);
w.sixpt5=mean(Data_6pt5V.w_exp);
n=1000;
theta=linspace(0,2160,n);

v_mod_10pt5=LCSMODEL(r,d,l,Data_10pt5V.theta_exp,w.tenpt5);
v_mod_9pt5=LCSMODEL(r,d,l,theta,w.ninept5);
v_mod_8pt5=LCSMODEL(r,d,l,theta,w.eightpt5);
v_mod_7pt5=LCSMODEL(r,d,l,theta,w.sevenpt5);
v_mod_6pt5=LCSMODEL(r,d,l,theta,w.sixpt5);

figure();
hold on
plot(Data_10pt5V.theta_exp,v_mod_10pt5,"b",LineWidth=2);
plot(Data_10pt5V.theta_exp,Data_10pt5V.v_exp,"r",LineWidth=2);
xlabel("Angular Position (Degs)")
ylabel("Vertical Velocity (cm/s)")
title("10pt5")
legend("theoretical", "Expimental",Location="bestoutside")
figure();
hold on
plot(theta,v_mod_9pt5,"b",LineWidth=2);
plot(Data_9pt5V.theta_exp,Data_9pt5V.v_exp,"r",LineWidth=2);
xlabel("Angular Position (Degs)")
ylabel("Vertical Velocity (cm/s)")
title("9pt5")
legend("theoretical", "Expimental",Location="bestoutside")
figure();
hold on
plot(theta,v_mod_8pt5,"b",LineWidth=2);
plot(Data_8pt5V.theta_exp,Data_8pt5V.v_exp,"r",LineWidth=2);
xlabel("Angular Position (Degs)")
ylabel("Vertical Velocity (cm/s)")
title("8pt5")
legend("theoretical", "Expimental",Location="bestoutside")
figure();
hold on
plot(theta,v_mod_7pt5,"b",LineWidth=2);
plot(Data_7pt5V.theta_exp,Data_7pt5V.v_exp,"r",LineWidth=2);
xlabel("Angular Position (Degs)")
ylabel("Vertical Velocity (cm/s)")
title("7pt5")
legend("theoretical", "Expimental",Location="bestoutside")
figure();
hold on
plot(theta,v_mod_6pt5,"b",LineWidth=2);
plot(Data_6pt5V.theta_exp,Data_6pt5V.v_exp,"r",LineWidth=2);
xlabel("Angular Position (Degs)")
ylabel("Vertical Velocity (cm/s)")
title("6pt5")
legend("theoretical", "Expimental",Location="bestoutside")