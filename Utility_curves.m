clc
clear all
tic;

%% Negative exponential utility function


%% 


%% Exponential utility function
R = 10^8;
b = 320*10^6;
a = -1000*10^6;

V = -350*10^6:10^6:350*10^6;
% Utility_out = Utility_function(V)
% U3 = Utility_out(1:501)
% figure(1);
% plot(V,U3,'-b*')


R = 10*10^6;
b = 350*10^6;
a = -350*10^6;
% U1 = (1-exp(-(V-a)./R))/(1-exp(-(b-a)./R));
% figure(2);
% plot(V,U1,'-*b')
% 
% 
% 
% U5 = log(V);
% plot(V,U5,'-b*')

% a = .1;
% U6 = (1/a)*V.^(a);
% plot(V,U6,'-b*')



% a = -0.00000009;
% U2 = -(1)*(1/a)*exp(-a*V);
% figure(1);
% plot(V,U2,'-*r')
% 
% a = -0.000000005;
% U2 = -(1)*(1/a)*exp(-a*V);
% figure(2);
% plot(V,U2,'-*r')
% 
% a = -0.00000002;
% U2 = -(1)*(1/a)*exp(-a*V);
% figure(3);
% plot(V,U2,'-*r')

% a = 0.00000009;
% U2 = -(1)*(1/a)*exp(-a*V);
% figure(4);
% plot(V,U2,'-*r')
% 
% a = -0.00000009;
% U2 = -(1)*(1/a)*exp(-a*V);
% figure(5);
% plot(V,U2,'-*r')

% U3 = -V.^(1/8);
% plot(V,U3,'-b*')

% U3 = real(-V.^(1/8))

% if V <= 0
% U3 = (-V.^(1/8));
% else
%     U3 = (V.^(1/8));
% end
% figure(3);
% plot(V,U3,'-g*')

% V = -100:10:100;
% a = 10;
% i = 0;
% for V = -350*10^6:10^6:350*10^6
%     i = i+1;
% if V <= 0
% U(i) = -(1/a)*V.^a;
% else
% U(i) = (1/a)*V.^a;    
% end
%  
% end
% V = -350*10^6:10^6:350*10^6;
% plot(V,U)

% a = 0.1;
% V = -0:10^6:350*10^6;
% U = (1/a)*V.^a;  
% figure(1);
% plot(V,U,'-b*')
% 
% a = -1;
% V = -0:10^6:350*10^6;
% U = (1/a)*V.^a;  
% figure(2);
% plot(V,U,'-b*')
% 






% i = 0;
% a = -0.01;
% for i = 1:3
% %     a
% V = -0*10^6:10^6:350*10^6;
% % a = -0.01;
% U = (1/a)*V.^a;  
% % figure(1);
% % plot(V,U,'-b*')
% i = i+1;
% a = a+0.1;
% figure(i);
% plot(V,U,'-b*')
% end


V = -0*10^6:10^6:350*10^6;
a = 2;
U = (1/a)*V.^a; 
figure(1);
plot(V,U,'-b*')

% a = 5;
% U = (1/a)*V.^a;  
% figure(2);
% plot(V,U,'-b*')
% % 
% a = 0.1;
% U = (1/a)*V.^a;  
% figure(3);
% plot(V,U,'-b*')
% 
% a = -0.8;
% U = (1/a)*V.^a;  
% figure(4);
% plot(V,U,'-b*')


% UU = -exp(2./V.^.5);
% figure(2);
% plot(V,UU,'-b*')


% [n,xout] = hist(U,1000);
% Exp = sum(xout.*n)/length(U)
% c = 0.000000001; 
% U7 = V.^(-c*V.^2);
% plot(V,U7,'-b*')

% Exp1 = (-exp(2/sqrt(400)) -exp(2/sqrt(700)) ) * .5
% Exp2 = (-exp(2/sqrt(500)) * .6 -exp(2/sqrt(700)) * .4 )


toc;

