clear; clc;

s1 = sin(5* pi /8);
c1 = cos(5* pi /8);
s2 = -sin(pi /8);
c2 = cos(pi /8);

x1 = [-1.0 3];
y1 = (1/s1)*(1-c1*x1);

x2 = [-1.0 3];
y2 = (1/s2)*(1-c2*x2);


clf;

plot(c1,s1,'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{x}_{1}$','Position',[c1-0.09 s1+0.15],'FontSize',24);

plot(c2,s2,'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{x}_{2}$','Position',[c2-0.28 s2-0.03],'FontSize',24);

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
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[2.6 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.9 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.3 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[0.7 ecc],0);
plot(elat,elon,'g:','linewidth',2)
hold on

quiver(0,0,0.96*c1,0.96*s1,1,'r','linewidth',2)
hold on

quiver(0,0,0.96*c2,0.96*s2,1,'r','linewidth',2)
hold on

quiver(0,0,1.83,1.83,1,'m','linewidth',2)
hold off;

axis([-1.0 3 -1.0 3])
% axis image
