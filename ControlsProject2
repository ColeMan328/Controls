% Cole Stoumbaugh
clear;clc

%% Given Values
b = 1200;
k1 = 2000;
k2 = 3200;
m1 = 100;
m2 = 160;

t = linspace(0,10,1000);

%% Solving for TF
syms s
A = [0,-1,0,0,0;
    (k1/m1),(-b/m1),(-k2/m1),0,0;
    0,1,0,-1,0;
    0,0,(k2/m2),0,0;
    0,0,0,1,0];
B = [1;(b/m1);0;0;0];
C = [0,0,0,0,1;
    0,0,(k2/m2),0,0;
    k1,-b,0,0,0];
D = [0;0;b];

[b,a] = ss2tf(A,B,C,D);

b(3,5) = round(b(3,5));
b(2,5) = round(b(2,5));

G1 = tf(b(1,:),a);
G2 = tf(b(2,:),a);
G3 = tf(b(3,:),a);

P = step(G1,t);
A = step(G2,t);
F = step(G3,t)/1000;

%% Plotting Uncompensated RLs

figure(1);clf % Position RL
rlocus(G1)

figure(2);clf % Acceleration RL
rlocus(G2)

figure(3);clf % Force Required RL
rlocus(G3)

%% Designing Compensators
