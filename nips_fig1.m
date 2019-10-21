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


plot(c1,s1,'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{x}_{1}$','Position',[c1+0.01 s1-0.07],'FontSize',24);

plot(c2,s2,'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{x}_{2}$','Position',[c2-0.11 s2-0.03],'FontSize',24);

plot([0 3],[0 0],'k');
hold on

plot([0 0],[0 3],'k');
hold on

plot(x1,y1,'linewidth',2);
hold on

plot(x2,y2,'linewidth',2);
hold on

ecc = axes2ecc(2,1);  
[elat,elon] = ellipse1(0,0,[1.925 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.6 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.3 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[1.0 ecc],0);
plot(elat,elon,'g--','linewidth',2)
hold on

[elat,elon] = ellipse1(0,0,[0.7 ecc],0);
plot(elat,elon,'g--','linewidth',2)

quiver(0,0,0.98*c1,0.98*s1,1,'r','linewidth',3)
hold on

quiver(0,0,0.98*c2,0.98*s2,1,'r','linewidth',3)
hold on

quiver(0,0,0.492*(c1+c2),0.492*(s1+s2),1,'c','linewidth',3)
hold on

plot(0.505*(c1+c2),0.505*(s1+s2),'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{m}$','Position',[0.505*(c1+c2)+0.001 0.505*(s1+s2)+0.064],'FontSize',24);

quiver(0,0,0.98*0.565,0.98*0.923,1,'m','linewidth',3)
hold on;

plot(0.565,0.923,'ko','MarkerSize',12,'linewidth',3);
hold on

text('Interpreter','latex','String','$ \mathbf{p}$','Position',[0.565+0.001 0.923+0.064],'FontSize',24);


axis([-0.2 1.5 -0.2 1.3])
% axis image
