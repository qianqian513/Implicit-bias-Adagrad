clear; clc;

s1 = sin(5* pi /8);
c1 = cos(5* pi /8);
s2 = -sin(pi /8);
c2 = cos(pi /8);

x1 = [-0.5 3];
y1 = (1/s1)*(1-c1*x1);

x2 = [-0.5 3];
y2 = (1/s2)*(1-c2*x2);


clf;
plot([0 3],[0 0],'k');
hold on

plot([0 0],[0 3],'k');
hold on

plot(x1,y1,'linewidth',2);
hold on

plot(x2,y2,'linewidth',2);
hold on

ecc = axes2ecc(1.5,1);  
[elat,elon] = ellipse1(0,0,[3.33 ecc],0);
plot(elat,elon,'g','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[2.6 ecc],0);
plot(elat,elon,'g')
hold on

[elat,elon] = ellipse1(0,0,[1.9 ecc],0);
plot(elat,elon,'g')
hold on

[elat,elon] = ellipse1(0,0,[1.3 ecc],0);
plot(elat,elon,'g')
hold on

[elat,elon] = ellipse1(0,0,[0.7 ecc],0);
plot(elat,elon,'g')
hold on

quiver(0,0,c1,s1,1,'r','linewidth',2)
hold on

quiver(0,0,c2,s2,1,'r','linewidth',2)
hold on

quiver(0,0,1.846,1.845,1,'m','linewidth',2)
hold off;

axis([-0.5 3 -0.5 3])
% axis image
