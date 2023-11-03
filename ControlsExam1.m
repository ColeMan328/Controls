% Cole Stoumbaugh
clc;
clear;

%% Problem 4

A = [-2, 1, 0; 0, 0, 1; 0, -6, -1];
B = [1; 0; 0];
C = [1, 0, 0];
D = [0];
[b,a] = ss2tf(A,B,C,D);
G = tf(b,a)

%% Problem 5

t = linspace(0,1.5);
c = 1-exp(-15*t);

figure(1);clf
plot(t,c);
