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

Datas = [Data_6pt5V, Data_7pt5V, Data_8pt5V, Data_9pt5V, Data_10pt5V];
%% Plot Exp Data

for i = 1:5
    LineName = 5.5 + i; % Figure name
    
    figure(i)
    hold on

    plot(Datas(i).theta_exp, Datas(i).v_exp, 'DisplayName', sprintf('Experiment Measured %.1f Volts', LineName), LineWidth=1.5);

    xlim([-50 2180])
    ylim([-1650 2600])
    legend show 
    xlabel('Theta (deg)')
    ylabel('Velocity (cm/s)')
    hold off

end


%% Calculate and plot our model's velocity vs theta

for i = 1:5
    omega = mean(Datas(i).w_exp);
    theta =  Datas(i).theta_exp;
    model_v{i} = LCSMODEL(7.5, 26, 15.5, theta, omega);


    LineName = 5.5 + i; % Figure name
    figure(i) % Specify figure to add to
    hold on

    plot(Datas(i).theta_exp, model_v{i}, 'DisplayName', sprintf('Model Calculated For %.1f Volts', LineName), LineWidth=1.5);

    xlim([-50 2180])
    ylim([-1650 2150])
    legend show 
    xlabel('Theta (deg)')
    ylabel('Velocity (cm/s)')
    hold off

end




