function [v_mod]=LCSMODEL(r,d,l,theta,w)
%% Units 
  %Inputs  
    % r     [cm]
    % d     [cm]
    % l     [cm]
    % theta [degs]
    % w     [deg/s]

  %Outputs
    % v_mod [mm/s] 

%% Beta Calculations
    % found by solving for the x position in terms of r, d, and theta and then
    % in terms of l and beta and solving for beta
    beta=asind((d-sind(theta))./l);

%% V_a Calculations
    % calculated using the V_A= V_O + W x R_AO equation where V_O is zero
    V_a=[-w.*r.*sind(theta), w.*r.*cosd(theta)];

%% V_b Calculations 
    % Calculated by solving for V_b in the i hat direction using V_B= V_A + W_AB x R_BA,
    % and setting it equal to zero then solving for omega_ab or W_AB
    % Can do this because the motion of point B is only in the j hat direction
    
    % Calculating the total V_B using V_B= V_A + W_AB x R_BA, where all
    % movement in the I hat direction is zero. 
    V_B=-w.*r.*sind(theta)-w.*r.*cosd(theta).*tand(beta);

%% Conversions
  % Converting the calculated data to make it easier for comparision with the
  % collected data 

  v_mod=V_B.*10;
end