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
[~, ~, ~, ~, Data_5pt5V] = LCSDATA(readtable("Data Files/Test1_5pt5V"));


%% Theoretical 
r =7.5;
l =25.5;
d =15.5;
w.tenpt5=mean(Data_10pt5V.w_exp);
w.ninept5=mean(Data_9pt5V.w_exp);
w.eightpt5=mean(Data_8pt5V.w_exp);
w.sevenpt5=mean(Data_7pt5V.w_exp);
w.sixpt5=mean(Data_6pt5V.w_exp);
w.fivept5=mean(Data_5pt5V.w_exp);
n=length(Data_10pt5V.theta_exp);
theta=linspace(0,2160,n);

v_mod_10pt5=LCSMODEL(r,d,l,Data_10pt5V.theta_exp,w.tenpt5);
v_mod_9pt5=LCSMODEL(r,d,l,Data_9pt5V.theta_exp,w.ninept5);
v_mod_8pt5=LCSMODEL(r,d,l,Data_8pt5V.theta_exp,w.eightpt5);
v_mod_7pt5=LCSMODEL(r,d,l,Data_7pt5V.theta_exp,w.sevenpt5);
v_mod_6pt5=LCSMODEL(r,d,l,Data_6pt5V.theta_exp,w.sixpt5);
v_mod_5pt5=LCSMODEL(r,d,l,Data_5pt5V.theta_exp,w.fivept5);


%% Signed Residuals
residual.tenpt5=v_mod_10pt5-Data_10pt5V.v_exp;
residual.ninept5=v_mod_9pt5-Data_9pt5V.v_exp;
residual.eightpt5=v_mod_8pt5-Data_8pt5V.v_exp;
residual.sevenpt5=v_mod_7pt5-Data_7pt5V.v_exp;
residual.sixpt5=v_mod_6pt5-Data_6pt5V.v_exp;
residual.fivept5=v_mod_5pt5-Data_5pt5V.v_exp;

%% Non Signed Residuals
abs_residuals.tenpt5=abs(residual.tenpt5);
abs_residuals.ninept5=abs(residual.ninept5);
abs_residuals.eightpt5=abs(residual.eightpt5);
abs_residuals.sevenpt5=abs(residual.sevenpt5);
abs_residuals.sixpt5=abs(residual.sixpt5);
abs_residuals.fivept5=abs(residual.fivept5);



%% Plotting
% Position vs. Velocity
figure(1)
    subplot(2,3,6);
    hold on
    plot(Data_10pt5V.theta_exp,v_mod_10pt5);
    plot(Data_10pt5V.theta_exp,Data_10pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("10pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
    subplot(2,3,5);
    hold on
    plot(Data_9pt5V.theta_exp,v_mod_9pt5);
    plot(Data_9pt5V.theta_exp,Data_9pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("9pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
    subplot(2,3,4);
    hold on
    plot(Data_8pt5V.theta_exp,v_mod_8pt5);
    plot(Data_8pt5V.theta_exp,Data_8pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("8pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
    subplot(2,3,3);
    hold on
    plot(Data_7pt5V.theta_exp,v_mod_7pt5);
    plot(Data_7pt5V.theta_exp,Data_7pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("7pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
    subplot(2,3,2);
    hold on
    plot(Data_6pt5V.theta_exp,v_mod_6pt5);
    plot(Data_6pt5V.theta_exp,Data_6pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("6pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
    subplot(2,3,1);
    hold on
    plot(Data_5pt5V.theta_exp,v_mod_5pt5);
    plot(Data_5pt5V.theta_exp,Data_5pt5V.v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title("5pt5 Position vs. Velocity")
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);

% Residuals
figure(2)
    subplot(2,3,6);
    hold on
    plot(Data_10pt5V.time,residual.tenpt5);
    yline(mean(residual.tenpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("10pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 2]);
    subplot(2,3,5);
    hold on
    plot(Data_9pt5V.time,residual.ninept5);
    yline(mean(residual.ninept5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("10pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 2.3]);
    subplot(2,3,4);
    hold on
    plot(Data_8pt5V.time,residual.eightpt5);
    yline(mean(residual.eightpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("8pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 2.6]);
    subplot(2,3,3);
    hold on
    plot(Data_7pt5V.time,residual.sevenpt5);
    yline(mean(residual.sevenpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("7pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 3.4]);
    subplot(2,3,2);
    hold on
    plot(Data_6pt5V.time,residual.sixpt5);
    yline(mean(residual.sixpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("6pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 4.3]);
    subplot(2,3,1);
    hold on
    plot(Data_5pt5V.time,residual.fivept5);
    yline(mean(residual.fivept5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("5pt5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0 6.8]);

%  Signed Residuals
figure(3)
    subplot(2,3,6);
    hold on
    plot(Data_10pt5V.time,abs_residuals.tenpt5);
    yline(mean(abs_residuals.tenpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("10.5 Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 2]);
    subplot(2,3,5);
    hold on
    plot(Data_9pt5V.time,abs_residuals.ninept5);
    yline(mean(abs_residuals.ninept5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("9.5 Non Signed Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 2.3]);
    subplot(2,3,4);
    hold on
    plot(Data_8pt5V.time,abs_residuals.eightpt5);
    yline(mean(abs_residuals.eightpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("8.5 Non Signed Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 2.6]);
    subplot(2,3,3);
    hold on
    plot(Data_7pt5V.time,abs_residuals.sevenpt5);
    yline(mean(abs_residuals.sevenpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("7.5 Non Signed Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 3.4]);
    subplot(2,3,2);
    hold on
    plot(Data_6pt5V.time,abs_residuals.sixpt5);
    yline(mean(abs_residuals.sixpt5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("6.5 Non Signed Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 4.3]);
    subplot(2,3,1);
    hold on
    plot(Data_5pt5V.time,abs_residuals.fivept5);
    yline(mean(abs_residuals.fivept5));
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("5.5 Non Signed Residual")
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-10 100]);
    xlim([0 6.8]);


% Residual comparison for one voltage
    figure(4)
    hold on
    plot(Data_10pt5V.time,abs_residuals.tenpt5);
    plot(Data_10pt5V.time,residual.tenpt5);
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("10pt5 Residual vs. Absolute Residual")
    legend("Absolute Residual", "Residual",Location="northeast")
    ylim([-60 60]);
    xlim([0 2]);

% Residual comparison 

    figure(5)
    hold on
    plot(Data_10pt5V.time,residual.tenpt5);
    plot(Data_9pt5V.time,residual.ninept5);
    plot(Data_8pt5V.time,residual.eightpt5);
    plot(Data_7pt5V.time,residual.sevenpt5);
    plot(Data_6pt5V.time,residual.sixpt5);
    plot(Data_5pt5V.time,residual.fivept5);
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("Comparison of Residuals")
    legend("10.5 Residual", "9.5 Residual", "8.5 Residual", "7.5 Residual", "6.5 Residual", "5.5 Residual",Location="northeast")
    ylim([-75 100]);
    xlim([0 2]);
 

% Absolute Residual comparison 

    figure(6)
    hold on
    plot(Data_10pt5V.time,abs_residuals.tenpt5);
    plot(Data_9pt5V.time,abs_residuals.ninept5);
    plot(Data_8pt5V.time,abs_residuals.eightpt5);
    plot(Data_7pt5V.time,abs_residuals.sevenpt5);
    plot(Data_6pt5V.time,abs_residuals.sixpt5);
    plot(Data_5pt5V.time,abs_residuals.fivept5);
    xlabel("Time (s)")
    ylabel("Vertical Velocity (cm/s)")
    title("Comparison of Absolute Residuals")
    legend("10.5 Residual", "9.5 Residual", "8.5 Residual", "7.5 Residual", "6.5 Residual", "5.5 Residual",Location="northeast")
    ylim([-10 100]);
    xlim([0 2]);