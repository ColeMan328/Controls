clc;
clear;
%Declaring symbolic variables
 s = sym('s');
 u = sym('u');
%Defining the system parameters
 m1 = 7;
 m2 = 4;
 v = 80;
 k1 = 1000;
 k2= 700;
 
 %Building the matrices required to find the desired outputs of the
 %velocity input
 a = [(s+(v/m1)) 0 -k1/m1 k2/m1 0;...
     0 s 0 -k2/m2 0;...
     1 0 s 0 0;...
     -1 1 0 s 0;...
     0 -1 0 0 s];
 
 a1 = [(v/m1)*u 0 -k1/m1 k2/m1 0;...
     0 s 0 -k2/m2 0;...
     u 0 s 0 0;...
     0 1 0 s 0;...
     0 -1 0 0 s];
 
 a3 = [(s+(v/m1)) 0 (v/m1)*u k2/m1 0;...
     0 s 0 -k2/m2 0;...
     1 0 u 0 0;...
     -1 1 0 s 0;...
     0 -1 0 0 s];
 a4 = [(s+(v/m1)) 0 -k1/m1 (v/m1)*u 0;...
     0 s 0 0 0;...
     1 0 s u 0;...
     -1 1 0 0 0;...
     0 -1 0 0 s];
 a5 = [(s+(v/m1)) 0 -k1/m1 k2/m1 (v/m1)*u;...
     0 s 0 -k2/m2 0;...
     1 0 s 0 u;...
     -1 1 0 s 0;...
     0 -1 0 0 0];
 
 %Taking the determinate of the matrices 
 s = det(a);
 s1 = det(a1);
 s3 = det(a3);
 s4 = det(a4);
 s5 = det(a5);
 
 %simplifying the results
 ds = simplify(s);
 ds1 = simplify(s1);
 ds3 = simplify(s3);
 ds4 = simplify(s4);
 ds5 = simplify(s5);
 
 %Defining the variables needed to solve for the input and output
 %polynomials
 Q1 = ds1/ds;
 Q3 = ds3/ds;
 Q4 = ds4/ds;
 Q5 = ds5/ds;
 
 %Defining the input and output polynomials
 y1 = (Q5);
 y2 = (-v*Q1)/u+(k1*Q3)/u+v;
 y3 = ((k2/m2)*Q4);
 
 %Defining the transfer functions
 g1 = y1/u;
 g2 = y2;
 g3 = y3/u;
 
 %simplifying the transfer functions
 G1 = simplify(g1);
 G2 = simplify(g2);
 G3 = simplify(g3);
 
 %Declaring the velocity input to postion output as a transfer function
 Gs1 = tf([14000 175000],[7 80 2925 14000 175000 0]);
 %step(G1,t)

 %Plotting the poles and zeros of the uncompensated system
 figure(1);clf
 pzmap(Gs1)
 title('Uncompenstated Sytstem Pole-Zero Map')
 
 %Plotting the root locus of the uncompenstated system
 figure(2); clf;
 rlocus(Gs1)
hold on
omg_n = 0;
zeta = 0.4037;
sgrid(zeta,omg_n)
hold off

 %Designing a PI controller
 Gc1 = tf([2.67282 1.89287],[1 0]);
 Gsc = Gs1*Gc1;
 
 %Plotting the poles and zeros of the compensated system
 figure(3);clf
 pzmap(Gsc)
 title('Compenstated Sytstem Pole-Zero Map')
 
 %Plotting the root locus of the compenstated system
 figure(4); clf;
 rlocus(Gsc)
hold on
omg_n = 0;
zeta = 0.4037;
sgrid(zeta,omg_n)
hold off

figure(5);clf;
margin(Gs1)

Gc2 = tf([0.16894 0.12088],[1 0])

figure(6); clf;
margin(Gs1*Gc2*5.95) 

