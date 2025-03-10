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

Datas = [Data_5pt5V, Data_6pt5V, Data_7pt5V, Data_8pt5V, Data_9pt5V, Data_10pt5V];

%% Calculate Model Velocities 
% Measured Parameters
r =7.5;                 % Radius of circle (cm)
l =26;                % Lenght of the connecting bar (cm)
d =15.5;                % Horizonatl Distance from shaft to origin(cm)

%Find average angular velocity from each test
for i = 1:6
    Datas(i).w_avg = mean(Datas(i).w_exp);
end

%Find model calculated velocities
for i = 1:6
    Datas(i).v_mod = LCSMODEL(r, d, l, Datas(i).theta_exp, Datas(i).w_exp);
end


%% Calculate Residuals
for i = 1:6
    % Signed Residuals
     Datas(i).residual = Datas(i).v_mod - Datas(i).v_exp;

    % Absolute Residuals
     Datas(i).ABSresiduals = abs(Datas(i).residual);

end

%% Plotting

% Position vs. Velocity
figure(1)
for i = 1:6                 % Loop Through Each Data set
    TitleName = 4.5 + i;    % Title of the figure
    subplot(2,3,(7-i));
    hold on
    plot(Datas(i).theta_exp, Datas(i).v_mod);
    plot(Datas(i).theta_exp, Datas(i).v_exp);
    xlabel("Angular Position (Degs)")
    ylabel("Vertical Velocity (cm/s)")
    title(sprintf('%.1fV Velocity vs Position', TitleName))
    legend("Theoretical", "Expimental",Location="northeast")
    ylim([-200 410]);
    xlim([0 2160]);
end
    
    
% Signed Residuals
figure(2)
for i = 1:6 
    TitleName = 4.5 + i; % Title of the figure
    subplot(2,3,(7-i));
    hold on
    plot(Datas(i).time, Datas(i).residual);
    yline(mean(Datas(i).residual));
    xlabel("Time (s)")
    ylabel("Vertical Velocity Error(cm/s)")
    title(sprintf('%.1fV Signed Residual vs Time', TitleName))
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0, max(Datas(i).time)])
end


% Absolute Residuals
figure(3)
for i = 1:6 
    TitleName = 4.5 + i; % Title of the figure
    subplot(2,3,(7-i));
    hold on
    plot(Datas(i).time, Datas(i).ABSresiduals);
    yline(mean(Datas(i).ABSresiduals));
    xlabel("Time (s)")
    ylabel("Vertical Velocity Error(cm/s)")
    title(sprintf('%.1fV Absolute Residual vs Time', TitleName))
    legend("Residual", "Residual Mean",Location="northeast")
    ylim([-75 150]);
    xlim([0, max(Datas(i).time)])
end    


% Residual comparison for one voltage (5.5 volts)
figure(4)
hold on
plot(Datas(1).time,Datas(1).ABSresiduals);
plot(Datas(1).time,Datas(1).residual);
xlabel("Time (s)")
ylabel("Vertical Velocity Error (cm/s)")
title("10.5V Residual vs. Absolute Residual")
legend("Absolute Residual", "Residual",Location="northeast")
ylim([ min(Datas(1).residual) - 2, max(Datas(1).ABSresiduals) + 2]);
xlim([0, max(Datas(1).time)])


% Residual comparison 
figure(5)
hold on
for i = 1:6 
    LineName = 4.5 + i; % Title of the line
    subplot(2,3,(7-i));
    hold on
    plot(Datas(i).time, Datas(i).residual, 'DisplayName', sprintf('%.1fV Signed Residual', LineName));
end
xlabel("Time (s)")
ylabel("Vertical Vemlocity Error (cm/s)")
title("Comparison of Residuals")
legend show
ylim([-75 100]);
xlim([0 2]);
 

% Absolute Residual comparison
figure(6)
hold on
for i = 1:6
plot(Datas(i).time,Datas(i).ABSresiduals); % Plots all abs residuals
end
xlabel("Time (s)")                          % Figure formatting
ylabel("Vertical Velocity (cm/s)")
title("Comparison of Absolute Residuals")
legend("10.5V Residual", "9.5V Residual", "8.5V Residual", "7.5V Residual", "6.5V Residual", "5.5V Residual",Location="northeast")
ylim([-10 100]);
xlim([0 2]);
hold off
