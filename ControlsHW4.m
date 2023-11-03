% Cole Stoumbaugh
clc;
clear;

s = tf('s');
GH = 1/(s*(s+1)*(s+5));
figure(1);clf
rlocus(GH)

GH2 = 1/(s*(s+1)*(s+5)*(s+10));
figure(2);clf
rlocus(GH2)

GH3 = ((s+2)*(s+6))/(s*(s+1)*(s+5)*(s+10));
figure(3);clf
rlocus(GH3)

GH4 = 1/((s^2)+(3*s)+10);
figure(4);clf
rlocus(GH4)

GH5 = ((s^2)+(2*s)+8)/(s*((s^2)+(2*s)+10));
figure(5);clf
rlocus(GH5)

GH6 = (s+2)/(s*(s+10)*((s^2)+(2*s)+2));
figure(6);clf
rlocus(GH6)
