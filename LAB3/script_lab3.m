%% Laboratory 3 - Session 5

close all;
clear;
clc;

%Initialization of variables
simul_t = 10; 

M = 1; %kg
G = 9.8; %m/s^2
Kt = 3.575*10^(-5); %N/(rad/s)^2

Z_0 = 2; 
Omega_0 =  sqrt((G*M)/Kt);
U_0 = Omega_0;

%% 3.4 Root-Locus of a Transfer function (K > 0)

% Open Loop Transfer Function
%  KG(s)H(s) , H(s) = 1, 
%   K = 600 * Kt * Omega_0)/M
%   G(s)= 1/(s^2(s+300))

    oltf = tf(1, [1 300 0 0 ]); 
    rlocus (oltf)
 
%comment on the fact that the poles are in the right side of the s-plane,
%comproving what was studied
 %figure

%% 3.5 Root-Locus of a Transfer function (K < 0)

% To test the case with K<0, it's simply need to add a "-" to the Transfer
% Function

    negative_oltf = tf (-1, [1 300 0 0 ]); 
    %rlocus(negative_oltf)

%figure

%% 3.7  System with PD Controller (root-locus)

% Open Loop Transfer Function
%   KG(s)
%    K = 600* Kt * Omega_0 * Kd /M
%    G(s) = (s + z)/(s^2(s+300))

    z_values = [-20 10 0 10 20 50 100 500];
    
    for i= 1:size(z_values)
    
        z= z_values(i);
        oltf_PD = tf ([1 z], [1 300 0 0]);
 
        rlocus (oltf_PD)
        

    end
 %Do plots and discuss results
 
%% 3.8 Obtaining the gains of a controller (z=1)

 oltf_step= tf ([1 1], [1 300 0 0]);
 [gain, poles]= rlocfind(oltf_step,-2.01);
 
 Kd= K*M/(600*Kt*Omega_0);
 Kp= Kd; 
 
 sim('Model_lab3.slx');
 
 
 
 
    
 
 
 















%% 3.9 Step Response Results with variable K and z











