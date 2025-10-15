clc;
clear all;

A = [0 1 0; 244.86 -0.094 -26.29; 0 0 -250];
B = [0; 0; 5];
C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);

[num, denum] = ss2tf(A, B, C, D);

disp('Poles of the system:');
poles = roots(denum);
disp(poles);

p_fast = [-120 -100 -150]; 
K1 = place(A, B, p_fast);
disp('Gain matrix for fast poles:');
disp(K1);

p_slow = [-2 -3 -4]; 
K2 = place(A, B, p_slow);
disp('Gain matrix for slow poles:');
disp(K2);

t = 0:0.01:10; 
disturbance = 0.05 * randn(size(t)); 

Ac_fast = A - B*K1;
Bc_fast = [B, [0; 0; 1]]; 
Cc_fast = C;
Dc_fast = [0 0];
sys_fast = ss(Ac_fast, Bc_fast, Cc_fast, Dc_fast);

u_fast = [ones(size(t)); disturbance]; 
[y_fast, t_fast, x_fast] = lsim(sys_fast, u_fast, t);

Ac_slow = A - B*K2;
Bc_slow = [B, [0; 0; 1]]; 
Cc_slow = C;
Dc_slow = [0 0];
sys_slow = ss(Ac_slow, Bc_slow, Cc_slow, Dc_slow);

u_slow = [ones(size(t)); disturbance]; 
[y_slow, t_slow, x_slow] = lsim(sys_slow, u_slow, t);

figure;
plot(t_fast, y_fast, 'LineWidth', 1.5);
title('Response with Fast Poles (Including White Noise Disturbance)');
xlabel('Time (s)');
ylabel('Output');
grid on;

figure;
plot(t_slow, y_slow, 'LineWidth', 1.5);
title('Response with Slow Poles (Including White Noise Disturbance)');
xlabel('Time (s)');
ylabel('Output');
grid on;
