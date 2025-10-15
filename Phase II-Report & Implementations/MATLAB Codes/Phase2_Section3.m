clc;
clear all;
format long g

A = [0 1 0; 244.86 -0.094 -26.29; 0 0 -250];
B = [0; 0; 5];
C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);

p_fast = [-120 -100 -150]; 
K1 = place(A, B, p_fast);

p_slow = [-2 -3 -4]; 
K2 = place(A, B, p_slow);

% controllabilty of the tracker system associated with state feedback
Co_state = [B , A*B ,A^2*B];
disp(Co_state)
rank(Co_state)
% controllabilty of the tracker system associated with integral-control
A_bar = [0 1 0 0; 244.86 -0.094 -26.29 0; 0 0 -250 0;-1 0 0 0];
B_bar = [0; 0; 5; 0];
Co_integral = [B_bar , A_bar*B_bar ,(A_bar)^2*B_bar,(A_bar)^3*B_bar];
disp(Co_integral)
rank(Co_integral)
K = place(A_bar, B_bar, [-10, -20, -30,-40])