clc;
clear;

t = linspace(0,3);
c = 1-exp(-15*t);

figure(1);clf
plot(t,c);

num = [16];
dem = [1 3 16];
h = tf(num,dem);
figure(2);clf
step(h)

num2 = [0.04];
dem2 = [1 0.02 0.04];
h2 = tf(num2,dem2);
figure(3);clf
step(h2)
