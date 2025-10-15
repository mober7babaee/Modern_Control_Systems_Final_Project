clc;
clear all; 

A = [0 1 0; 244.86 -0.094 -26.29; 0 0 -250];
B = [0; 0; 5];
C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);


A_n = transpose([0 1 0; 244.86 -0.094 -26.29; 0 0 -250]);
B_n = transpose([1 0 0]);

%a(s) = s^3 + 250.094 s^2 -221.36 s - 61215
% alpha(s) = (s+3)(s+2)(s+4)   slow pole 
% alpha(s)=(s+100)(s+120)(s+150)
sub1=[-241.094,247.36,61239];
sub2=[370-250.094,45000+221.36,1800000+61215];

sigh = [1 250.094 -221.36;0 1 250.094; 0 0 1];

sigh_inverse = inv(sigh)

Controlable=ctrb(A_n,B_n)

rank(Controlable)

Controlable_inverse = inv(Controlable)

K1 = place(A, B, [-4 -2 -3])
K2 = place(A, B, [-100 -120 -150])

K_slow = sub1 * sigh_inverse * Controlable_inverse 
K_fast = sub2 * sigh_inverse * Controlable_inverse


L_slow = transpose(K_slow)
Ahat_slow = A - L_slow * C

L_fast = transpose(K_fast)
Ahat_fast = A - L_fast * C
