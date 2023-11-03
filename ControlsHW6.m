% Cole Stoumbaugh
clear;clc

s = tf('s');
G = 5000/(s*(s+20)*(s+50));

sys = feedback(G,1);
t = linspace(0,1.5,10000);
zeta = 0.69;    % calculated zeta

figure(1);clf   % orig system RL
rlocus(G,linspace(0,70,10000))
zgrid(zeta,[])  % zeta line

y = step(sys,t);    % orig system step response
stepinfo(sys)

figure(2);clf
plot(t,y,'LineWidth',2)
title('Sys Step Response, No Control')

k = 1.46;   % gain found from RL and zeta line
syscount = feedback(k*G,1);
stepinfo(syscount)

yc = step(syscount,t);  % step response with gain for 5% OS

figure(3);clf
plot(t,y,'LineWidth',2);hold on
plot(t,yc,'LineWidth',2)
title('Sys Step Response')
legend('Uncomp','5% OS')

yr = step((sys/s),linspace(0,10,10000));    % Orig sys ramp response
figure(4);clf
plot(linspace(0,10,10000),yr,'LineWidth',2);hold on
rmp = plot([0 10], [0 10]);
title('Sys Ramp Response without No Control')
rmp = linspace(0,10,10000);
er = rmp - yr';
figure(11);clf
plot(linspace(0,10,10000),er)

%% Problem 1 part e PI Compensator
z1 = 0.1;
D = (s+z1)/s;

figure(5);clf   % RL of Compensated sys
rlocus(D*G);hold on
plot(-8.2,8.4,'ko','MarkerFaceColor','k')

sys4 = feedback(k*D*G,1);   % sys with gain and PI comp
y4 = step(sys4,t);

figure(6);clf
plot(t,y4);hold on
plot(t,y)
title('Sys Step Response')
legend('Compensated','Uncompensated')

yrcomp = step((sys4/s),linspace(0,10,10000));   % sys ramp w/ gain and PI
figure(7);clf
plot(linspace(0,10,10000),yrcomp,'LineWidth',2);hold on
plot([0 10], [0 10])
title('Sys Ramp Response With Control')
er2 = rmp - yrcomp';
figure(12);clf
plot(linspace(0,10,10000),er2)

%% Problem 2 Lag Compensator
clear D
zc = 0.2;
pc = 0.1;
D = (s+zc)/(s+pc);

figure(8);clf
rlocus(D*G)
zgrid(zeta,[])

sys5 = feedback(k*D*G,1);
y5 = step(sys5,t);
stepinfo(y5)
figure(9);clf
plot(t,y5,'--r');hold on
plot(t,y,'k')
title('Step Response after Lag Controller')
legend('Compensated Response','Orig Response')

yrcomp2 = step((sys5/s),linspace(0,10,10000));   % sys ramp w/ gain and LAG
figure(10);clf
plot(linspace(0,10,10000),yrcomp2,'LineWidth',2);hold on
plot([0 10], [0 10])
title('Sys Ramp Response With Control')

er3 = rmp - yrcomp2';
figure(13);clf
plot(linspace(0,10,10000),er3)
