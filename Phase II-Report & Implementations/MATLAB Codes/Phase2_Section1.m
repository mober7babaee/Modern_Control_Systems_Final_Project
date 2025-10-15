clc;
clear;

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
disp('Gain matrix for fast poles:');
K1 = place(A, B, p_fast)
Ac_fast = (A - B*K1);
sys1 = ss(Ac_fast, B, C, D);
step(sys1);
figure;

p_slow = [-2 -3 -4];
disp('Gain matrix for slow poles:');
K2 = place(A, B, p_slow)
Ac_slow = (A - B*K2);
sys2 = ss(Ac_slow, B, C, D);
step(sys2);