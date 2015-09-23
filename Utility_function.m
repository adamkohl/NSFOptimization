function Utility_out = Utility_function(V)

%% Negative exponential utility function
% a = 0.00000009;
a1 = -.00000009;
U1 = -(1)*(1/a1)*exp(-a1*V);

a2 = .00000009;
U2 = -(1)*(1/a2)*exp(-a2*V);

%% 

U3 = V.^(1/8);



%% Exponential utility function

R1 = 10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U4 = (1-exp(-(V-a3)./R1))/(1-exp(-(b1-a3)./R1));

R2 = -10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U5 = (1-exp(-(V-a3)./R2))/(1-exp(-(b1-a3)./R2));



Utility_out = [U1,U2,U3,U4,U5];
end