clear;clc

zeta = 0.63;
s = tf('s');
G = 3/((s+1)*(s+3));

sys = feedback(G,1);
t = linspace(0,30,1000);
y = step(sys,t);

stepinfo(sys)

figure(1);clf
plot(t,y,'LineWidth',2)
title('Sys Response, No Control')

figure(2);clf
rlocus(G,linspace(0,10,10000))
zgrid(zeta,[])

k = 2.36;
syscount = feedback(k*G,1);
yc = step(syscount,t);

figure(3);clf
plot(t,y,'-m','LineWidth',2);hold on
plot(t,yc,'k','LineWidth',2)
plot([0 10],[1 1],'-b')
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

k = 3.56;
sys4 = feedback(k*D*G,1)
y4 = step(sys4,t);

figure(7);clf
