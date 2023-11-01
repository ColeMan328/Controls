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

zeta1 = (-log(.125))/(sqrt(pi^2 + log(.125)^2));

%% Plotting Uncompensated System
figure(1);clf % Position RL
rlocus(G1)
zgrid(zeta1,[])

figure(2);clf % Acceleration RL
rlocus(G2)

figure(3);clf % Force Required RL
rlocus(G3)

figure(4);clf % time response
plot(t,P);hold on
plot(t,A);hold on
plot(t,F)
legend('xPosition','Acceleration','Force')
xlabel('Time (s)')
ylabel('y(t)')

%% Designing Compensators
t2 = linspace(0,20,1000);
D = 1;
sysP = feedback(D*G1,1);    % feedback response
sysA = feedback(D,G1)*G2;
sysF = feedback(D,G1)*G3;
p = 2*step(sysP,t);        % feedback step response
a = 2*step(sysA,t);
f = (2*step(sysF,t))/1000;

figure(5);clf % time response
plot(t,p);hold on
plot(t,a);hold on
plot(t,f)
legend('xPosition','Acceleration','Force')
xlabel('Time (s)')
ylabel('y(t)')

zeta1 = (-log(.125))/(sqrt(pi^2 + log(.125)^2));
zc1 = 4.7;
pc = 1.75;
k = .261;
D = tf([1 zc1],[1 pc]);
sysP1 = 2*step(feedback(D*G1,1),t);
figure(6);clf
rlocus(D*G1);hold on
plot(-1.85,3.35,'ko','MarkerFaceColor','k')
zgrid(zeta1,[])

sysP1 = 2*step(feedback(k*D*G1,1),t);
sysA1 = 2*step(feedback(k*D*G1,1)*G2,t);
sysF1 = 2*step(feedback(k*D*G1,1)*G3,t);

stepinfo(sysP1)
stepinfo(sysA1)
stepinfo(sysF1)

%% Plotting Compensated Step Response
figure(7);clf
plot(t,p);hold on
plot(t,sysP1);hold on
xline(4,'--g');hold on
yline(1.75,'--k');hold on
yline(2.25,'--k');hold on
plot(4,1.75,'ko','MarkerFaceColor','k');hold on
plot(2.4998199,1.75,'ko','MarkerFaceColor','k')
legend('Old Position','New Position','Max Time Constrant','Min/Max Distance Constrant')
xlabel('Time (s)')
ylabel('y(t)')

figure(8);clf
plot(t,a);hold on
plot(t,sysA1)
yline(4,'--k')
yline(-4,'--k')
legend('Old Acceleration','New Acceleration','Max/Min Acceleration Constraint')
xlabel('Time (s)')
ylabel('y(t)')

figure(9);clf
plot(t,(f*1000));hold on
plot(t,sysF1)
yline(500,'--k')
yline(-500,'--k')
legend('Old Force','New Force','Max/Min Force Constraint')
xlabel('Time (s)')
ylabel('y(t)')

figure(10);clf
plot(t,sysP1);hold on
plot(t,sysA1);hold on
plot(t,(sysF1/1000));hold on
plot(2.4998199,1.75,'ko','MarkerFaceColor','k');hold on
plot(1.29,0.4972001,'ko','MarkerFaceColor','k');hold on
plot(1.29,2.1937,'ko','MarkerFaceColor','k')
legend('xPosition','Acceleration','Force')
xlabel('Time (s)')
ylabel('y(t)')

%% Plotting Compensated RL
figure(11);clf % Compensated Position RL
rlocus(k*D*G1)

figure(12);clf % Compensated Acceleration RL
rlocus(k*D*G2)

figure(13);clf % Compensated Force Required RL
rlocus(k*D*G3)
