% 2019.10.18
% a iteration of AdaGrad
% input:
% w_init --- the initial value of w 
% w_old --- a column of w 
% eta stepsize
% epsilon = 0.00000001
% grad --- the gradient, a column of p partial derivatives

% output:
% w_new --- a column of p parameters 

clear; clc; clf;

epsilon = 0.00000001;

n_stage = 7;

% dataset
%
theta_1 = pi/8;
theta_2 = pi/20;


mean_angle  = 0.5*(theta_1 + theta_2);
x_1 = [cos(theta_1) sin(theta_1)];
x_2 = [cos(theta_2) sin(theta_2)];

drct_mm = [cos(mean_angle) sin(mean_angle)];   % Max Margin ·½Ïò

% output:
% initial parameter
%w_init = [1 2];
w_init = [0 0];

tic; 
%=================================================================================
% case for \eta = 0.5
eta05 = 0.5;

w_now = w_init;  % w(0)
s_now = [0 0];   % gradient suared 
h_now = [1 1];   % coefficients 
g_now = [0 0];   % gradient
     
drct_his05 = zeros(2 + n_stage, 2);   
drct_his05(1,:) = [cos(0.5*pi) sin(0.5*pi)]; % save the direction of w(t)

for count_stage = 0:n_stage
    for t_now = 10^count_stage:10^(count_stage+1)-1
        g_now = -exp(-dot(w_now, x_1))* x_1 -exp(-dot(w_now, x_2))* x_2;
        s_now = s_now + g_now .* g_now;   % sum of gradient suared 
        h_now = 1./sqrt(s_now + epsilon); % h(t) 
        
        % momentum
        m_now = - eta05 * g_now.* h_now;
        
        % AdaGrad iterates 
        w_now = w_now + m_now; 
    end
    
    % compute loss
    loss_now05 = exp(-dot(w_now, x_1)) + exp(-dot(w_now, x_2));
    
    drct_now05 = (1/norm(w_now))*w_now;  % normalize w(t)
    drct_his05(2+count_stage,:) = drct_now05; % save the direction of w(t)
    
end

norm_diff_drct_mm_his05 = zeros(2 + n_stage,1); 
for count_stage = 0:n_stage+1
    norm_diff_drct_mm05 = norm(drct_mm - drct_his05(1+count_stage,:));
    norm_diff_drct_mm_his05(1+count_stage,1) = norm_diff_drct_mm05;
end

%==============================================================
% case for \eta = 0.1
eta01 = 0.1;

w_now = w_init;  % w(0)
s_now = [0 0];   % gradient suared 
h_now = [1 1];   % coefficients 
g_now = [0 0];   % gradient
  
drct_his01 = zeros(2 + n_stage, 2);   
drct_his01(1,:) = [cos(0.5*pi) sin(0.5*pi)]; % save the direction of w(t)

for count_stage = 0:n_stage
   for t_now = 10^count_stage:10^(count_stage+1)-1
       g_now = -exp(-dot(w_now, x_1))* x_1 -exp(-dot(w_now, x_2))* x_2;
       s_now = s_now + g_now .* g_now;   % sum of gradient suared 
       h_now = 1./sqrt(s_now + epsilon); % h(t) 
       
       % momentum
       m_now = - eta01 * g_now.* h_now;
       
       % AdaGrad iterates 
       w_now = w_now + m_now;   
   end
      
   % compute loss
   loss_now01 = exp(-dot(w_now, x_1)) + exp(-dot(w_now, x_2));
   
   drct_now01 = (1/norm(w_now))*w_now;  % normalize w(t)
   drct_his01(2+count_stage,:) = drct_now01; % save the direction of w(t)   
end

norm_diff_drct_mm_his01 = zeros(2 + n_stage,1); 
for count_stage = 0:n_stage+1
    norm_diff_drct_mm01 = norm(drct_mm -  drct_his01(1+count_stage,:));
    norm_diff_drct_mm_his01(1+count_stage,1) = norm_diff_drct_mm01;
end

% ==============================================================
toc; 

clf;

plot(0:n_stage+1, norm_diff_drct_mm_his05, 'r', 'linewidth', 3.0);
hold on
plot(0:n_stage+1, norm_diff_drct_mm_his01, 'b', 'linewidth', 3.0);


xlabel('Number of iterations');
ylabel('Norm'); 

set(get(gca,'XLabel'),'FontSize',24,'FontName','Times New Roman');
set(get(gca,'YLabel'),'FontSize',24,'FontName','Times New Roman');

set(gca,'FontName','Times New Roman','FontSize',20);

pos=axis;
axis([pos(1),pos(2),0.25, 0.6]);

xspacing = (pos(2)-pos(1))/8;

text('Interpreter','latex','String','$ \eta = 0.1 $','Position',[5*xspacing, 0.48],'FontSize',24);
text('Interpreter','latex','String','$ \eta = 0.5 $','Position',[4*xspacing, 0.425],'FontSize',24);

set(gca, 'XTick', [0 xspacing 2*xspacing 3*xspacing 4*xspacing 5*xspacing 6*xspacing 7*xspacing 8*xspacing]); 
set(gca,'XTickLabel',{'10^0','10^1','10^2','10^3','10^4','10^5','10^6','10^7','10^8'}); 

set(gca, 'YTick', [0.3 0.35 0.4 0.45 0.5 0.55 0.6]); 
set(gca,'YTickLabel',{'0.3','0.35','0.4','0.45','0.5','0.55','0.6'}); 
