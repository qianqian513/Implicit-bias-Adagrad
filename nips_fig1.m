clear; clc;

s1 = sin(3* pi /8);
c1 = cos(3* pi /8);
s2 = sin(9* pi /20);
c2 = cos(9* pi /20);

x1 = [-0.5 3];
y1 = (1/s1)*(1-c1*x1);

x2 = [-0.5 3];
y2 = (1/s2)*(1-c2*x2);


clf;
plot([0 3],[0 0],'k');
hold on

plot([0 0],[0 3],'k');
hold on

plot(x1,y1,'linewidth',3);
hold on

plot(x2,y2,'linewidth',3);
hold on

ecc = axes2ecc(2,1);  
[elat,elon] = ellipse1(0,0,[1.925 ecc],0);
plot(elat,elon,'g','linewidth',3)
hold on

[elat,elon] = ellipse1(0,0,[1.6 ecc],0);
plot(elat,elon,'g','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.3 ecc],0);
plot(elat,elon,'g','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.0 ecc],0);
plot(elat,elon,'g','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[0.7 ecc],0);
plot(elat,elon,'g','linewidth',2)
hold on

quiver(0,0,c1,s1,1,'r','linewidth',4)
hold on

quiver(0,0,c2,s2,1,'r','linewidth',4)
hold on

quiver(0,0,0.5055*(c1+c2),0.5055*(s1+s2),1,'c','linewidth',4)
hold on

quiver(0,0,0.565,0.923,1,'m','linewidth',4)
hold off;

axis([-0.2 1.5 -0.2 1.3])
% axis image
