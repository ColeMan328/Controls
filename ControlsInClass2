clear;
clc;

zeta = 0.69;
s = tf('s');
G = 5000/(s*(s+20)*(s+50));

sys = feedback(G,1);
t = linspace(0,1.5,1000);
y = step(sys,t);

stepinfo(sys)

figure(1);clf
plot(t,y,'LineWidth',2)
title('Sys Response, No Control')

figure(2);clf
rlocus(G,linspace(0,50,10000));hold on
zgrid(zeta,[])

k = 1.47;
syscount = feedback(k*G,1);
yc = step(syscount,t);
stepinfo(syscount)
figure(3);clf
plot(t,y,'-m','LineWidth',2);hold on
plot(t,yc,'k','LineWidth',2)
plot([0 1.5],[1 1],'-b')
legend('Uncut','Control Resp','Reference')

%%

D = 1/s;

sys = feedback(D*G,1)
figure(4);clf
rlocus(D*G);hold on
zgrid(zeta,[])

k = .468;
sys3 = feedback(k*D*G,1);
y3 = step(sys3,t);
stepinfo(y3)

figure(4);clf
plot(t,y3)

%% PI Compensator
z1 = 0.1;
D = (s+z1)/s;

figure(5);clf
rlocus(D*G);hold on
plot(-2,3.17,'ko','MarkerFaceColor','k')

k = 1.47;
sys4 = feedback(k*D*G,1)
y4 = step(sys4,t);

figure(7);clf
plot(t,y4)

%% Lag Compensator
clear D
zc = 0.2;
pc = 0.1;
D = (s+zc)/(s+pc);

figure(8);clf
rlocus(D*G)

sys5 = feedback(k*D*G,1);
y5 = step(sys5,t);

figure(9);clf
plot(t,y5,'--r');hold on
plot(t,y*k,'k')
legend('Plane resp','Comp resp')
