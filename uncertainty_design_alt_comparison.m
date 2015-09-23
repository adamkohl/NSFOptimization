clc
clear all
format longEng
tic;
xx1 =[ 95e+009    80e+009    61.0000000000000e+000    6e+000   850e+000    200e-003...
200e-003    13e+000    3e+000    302e+000    98e+000    40e+000...
 105e+000    38e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];

xx2 =[ 95.05e+009    80.05e+009    61.0000000000000e+000    6.2e+000   851e+000    202e-003...
202e-003    13.05e+000    3.05e+000    303e+000    99e+000    40.4e+000...
 105.5e+000    38.4e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];


xx3 =[ 94.05e+009    79.05e+009    61.0000000000000e+000    5.98e+000   849e+000    198e-003...
198e-003    12.05e+000    2.95e+000    300e+000    97e+000    39.6e+000...
 103e+000    37e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];


xx4 =[ 95.005e+009    80.005e+009    61.0000000000000e+000    6.005e+000   850.5e+000    200e-003...
200e-003    13e+000    3e+000    302e+000    98e+000    40e+000...
 105e+000    38e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];

xx1 =[5e9   5e9   30   20  100   2,...
2  5   5   100  100   40,...
 75    40,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

xx2 =[5.05e9   5.05e9   30   20.2  101   2.02,...
2.02  5.05   5.05   101  101   40.4,...
 75.75    40.4,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

xx1 = xx2; 

xx3 =[4.95e9   4.955e9   30   19.98  99   1.98,...
1.98  4.95   4.95   99  99   39.6,...
 74.25    39.6,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

xx4 =[5.005e9   5.005e9   30   20  100   2,...
2  5   5   100  100   40,...
 75    40,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];
xx = [xx1;xx2;xx3;xx4];
no_of_samples = 100;
a = .00000009;
i = 0;
ii = 0;
jj = 0;




for jj = 1
    x = xx(jj,:);
     
operational_lifetime = 10;
f = x(1);
fup = x(2);
N = x(3);
Pst = x(4);
Pgt = x(5);
Dsat_trans = x(6);
Dsat_rec = x(7);
Dground_rec = x(8);
Dground_trans = x(9);
Sat_long = x(10);
Ground_long = x(11);
Ground_lat = x(12);
Ground_long_r = x(13);
Ground_lat_r = x(14);
Amp = x(15);
Prop_tech = x(16);
Prop = x(17);
Batt = x(18);
SA_material = x(19);
a_e_SA = x(20);
a_e_trans_antenna = x(21);
a_e_rec_antenna = x(22);
a_e_bus = x(23);
eps_rad_battery = x(24);
eps_rad_RW = x(25);
eps_rad_tank = x(26);
bus_config = x(27);
bus_material = x(28);
Prop_tank_material = x(29);
launchsite = x(30);
Launch_vehicle = x(31);
Controller = x(32);
Ant_type = x(33);
Ant_type_ground = x(34);
Power = x(35);
Thermal = x(36);
h = 3.5786000*10^7;
V(jj) = -satellite_objective(x);
for i = 1:no_of_samples
      r1 = rand(1);
    r2 = rand(1);
    r3 = rand(1);
    r4 = rand(1);
    r5 = rand(1);
    r6 = rand(1);
    r7 = rand(1);
    r8 = rand(1);
    r9 = rand(1);
    r10 = rand(1);
    r11 = rand(1);
    r12 = rand(1);
    r13 = rand(1);

pd1 = makedist('Tri',Dsat_trans-0.25*r1,Dsat_trans,Dsat_trans+0.1*r1);
pd2 = makedist('Tri',Dsat_rec-0.25*r2,Dsat_rec,Dsat_rec+0.1*r2);
pd3 = makedist('Tri',Dground_trans-0.25*r3,Dground_trans,Dground_trans+0.1*r3);
pd4 = makedist('Tri',Dground_rec-0.25*r4,Dground_rec,Dground_rec+0.1*r4);
pd5 = makedist('Tri',Sat_long-0.25*r5,Sat_long,Sat_long+0.5*r5);
pd6 = makedist('Tri',Ground_long-0.25*r6,Ground_long,Ground_long+0.5*r6);
pd7 = makedist('Tri',Ground_lat-0.25*r7,Ground_lat,Ground_lat+0.5*r7);
pd8 = makedist('Tri',Ground_long_r-0.25*r8,Ground_long_r,Ground_long_r+0.5*r8);
pd9 = makedist('Tri',Ground_lat_r-0.25*r9,Ground_lat_r,Ground_lat_r+0.5*r9);
pd10 = makedist('Tri',Pst-0.1*r10,Pst,Pst+0.5*r10);
pd11 = makedist('Tri',Pgt-0.1*r11,Pgt,Pgt+0.5*r11);
pd12 = makedist('Tri',f-10^2*r12,f,f+10^3*r12);
pd13 = makedist('Tri',fup-10^2*r13,fup,fup+10^3*r13);

UDsat_trans(i) = random(pd1,1);
UDsat_rec(i) = random(pd2,1);
UDground_trans(i) = random(pd3,1);
UDground_rec(i) = random(pd4,1);
USat_long(i) = random(pd5,1);
UGround_long(i) = random(pd6,1);
UGround_lat(i) = random(pd7,1);
UGround_long_r(i) = random(pd8,1);
UGround_lat_r(i) = random(pd9,1);
UPst(i) = random(pd10,1);
UPgt(i) = random(pd11,1);
Uf(i) = random(pd12,1);
Ufup(i) = random(pd13,1);
    
    x(8) = UDground_rec(i);
    x(9) = UDground_trans(i);
    x(7) = UDsat_rec(i);
    x(6) = UDsat_trans(i);
    x(12) = UGround_lat(i);
    x(14) = UGround_lat_r(i);
    x(11) = UGround_long(i);
    x(13) = UGround_long_r(i);
    x(5) = UPgt(i);
    x(4) = UPst(i);
    x(10) = USat_long(i);
    x(1) = Uf(i);
    x(2) = Ufup(i);
    
    
    y(i) = -satellite_objective(x);
    
% Utility_out = Utility_function(y);
% U1(i) = Utility_out(1);
% U2(i) = Utility_out(2);
% U3(i) = Utility_out(3);
% U4(i) = Utility_out(4);
% U5(i) = Utility_out(5);

%% Negative exponential utility function
% a = 0.00000009;
a1 = -.00000009;
U1 = -(1/a1)*exp(-a1*y(i));

a2 = .00000009;
U2 = -(1/a2)*exp(-a2*y(i));

%% 

U3 = y(i).^(1/8);



%% Exponential utility function

R1 = 10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U4 = (1-exp(-(y(i)-a3)./R1))/(1-exp(-(b1-a3)./R1));

R2 = -10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U5 = (1-exp(-(y(i)-a3)./R2))/(1-exp(-(b1-a3)./R2));

end
linespec = {'b','b','b','r','g','y','b-','m-','k','r-'};
% hold on
% figure(1);
M(jj)=mean(y);
%  Utility_Exp_outcome1(jj) = -(1/a)*exp(-a*M(jj));
%  Utility_Exp_outcome2(jj) = -(1/a)*exp(-a*M(jj));
%  Utility_Exp_outcome3(jj) = -(1/a)*exp(-a*M(jj));
%  Utility_Exp_outcome4(jj) = -(1/a)*exp(-a*M(jj));
% [n,xout] = hist(y,100);

% plot(xout,n/trapz(xout,n),linespec{jj});

[n1,xout1] = hist(U1,1000);
Exp1(jj) = sum(xout1.*n1)/length(U1);

[n2,xout2] = hist(U2,1000);
Exp2(jj) = sum(xout2.*n2)/length(U2);

[n3,xout3] = hist(U3,1000);
Exp3(jj) = sum(xout3.*n3)/length(U3);

[n4,xout4] = hist(U4,1000);
Exp4(jj) = sum(xout4.*n4)/length(U4);

[n5,xout5] = hist(U5,1000);
Exp5(jj) = sum(xout5.*n5)/length(U5);

end



for jj = 2
    x = xx(jj,:);
     
operational_lifetime = 10;
f = x(1);
fup = x(2);
N = x(3);
Pst = x(4);
Pgt = x(5);
Dsat_trans = x(6);
Dsat_rec = x(7);
Dground_rec = x(8);
Dground_trans = x(9);
Sat_long = x(10);
Ground_long = x(11);
Ground_lat = x(12);
Ground_long_r = x(13);
Ground_lat_r = x(14);
Amp = x(15);
Prop_tech = x(16);
Prop = x(17);
Batt = x(18);
SA_material = x(19);
a_e_SA = x(20);
a_e_trans_antenna = x(21);
a_e_rec_antenna = x(22);
a_e_bus = x(23);
eps_rad_battery = x(24);
eps_rad_RW = x(25);
eps_rad_tank = x(26);
bus_config = x(27);
bus_material = x(28);
Prop_tank_material = x(29);
launchsite = x(30);
Launch_vehicle = x(31);
Controller = x(32);
Ant_type = x(33);
Ant_type_ground = x(34);
Power = x(35);
Thermal = x(36);
h = 3.5786000*10^7;
V(jj) = -satellite_objective(x);

for ii = 1:no_of_samples
      r1 = rand(1);
    r2 = rand(1);
    r3 = rand(1);
    r4 = rand(1);
    r5 = rand(1);
    r6 = rand(1);
    r7 = rand(1);
    r8 = rand(1);
    r9 = rand(1);
    r10 = rand(1);
    r11 = rand(1);
    r12 = rand(1);
    r13 = rand(1);

pd1 = makedist('Tri',Dsat_trans-0.75*r1,Dsat_trans,Dsat_trans+0.75*r1);
pd2 = makedist('Tri',Dsat_rec-0.75*r2,Dsat_rec,Dsat_rec+0.75*r2);
pd3 = makedist('Tri',Dground_trans-0.75*r3,Dground_trans,Dground_trans+0.75*r3);
pd4 = makedist('Tri',Dground_rec-0.75*r4,Dground_rec,Dground_rec+0.75*r4);
pd5 = makedist('Tri',Sat_long-0.75*r5,Sat_long,Sat_long+0.75*r5);
pd6 = makedist('Tri',Ground_long-0.75*r6,Ground_long,Ground_long+0.75*r6);
pd7 = makedist('Tri',Ground_lat-0.75*r7,Ground_lat,Ground_lat+0.75*r7);
pd8 = makedist('Tri',Ground_long_r-0.75*r8,Ground_long_r,Ground_long_r+0.75*r8);
pd9 = makedist('Tri',Ground_lat_r-0.75*r9,Ground_lat_r,Ground_lat_r+0.75*r9);
pd10 = makedist('Tri',Pst-0.5*r10,Pst,Pst+0.75*r10);
pd11 = makedist('Tri',Pgt-0.5*r11,Pgt,Pgt+0.75*r11);
pd12 = makedist('Tri',f-10^4*r12,f,f+10^4*r12);
pd13 = makedist('Tri',fup-10^4*r13,fup,fup+10^4*r13);

UDsat_trans(ii) = random(pd1,1);
UDsat_rec(ii) = random(pd2,1);
UDground_trans(ii) = random(pd3,1);
UDground_rec(ii) = random(pd4,1);
USat_long(ii) = random(pd5,1);
UGround_long(ii) = random(pd6,1);
UGround_lat(ii) = random(pd7,1);
UGround_long_r(ii) = random(pd8,1);
UGround_lat_r(ii) = random(pd9,1);
UPst(ii) = random(pd10,1);
UPgt(ii) = random(pd11,1);
Uf(ii) = random(pd12,1);
Ufup(ii) = random(pd13,1);
    
    x(8) = UDground_rec(ii);
    x(9) = UDground_trans(ii);
    x(7) = UDsat_rec(ii);
    x(6) = UDsat_trans(ii);
    x(12) = UGround_lat(ii);
    x(14) = UGround_lat_r(ii);
    x(11) = UGround_long(ii);
    x(13) = UGround_long_r(ii);
    x(5) = UPgt(ii);
    x(4) = UPst(ii);
    x(10) = USat_long(ii);
    x(1) = Uf(ii);
    x(2) = Ufup(ii);
    
    
    yy(ii) = -satellite_objective(x);
    
   
% Utility_out = Utility_function(y);
% U1(i) = Utility_out(1);
% U2(i) = Utility_out(2);
% U3(i) = Utility_out(3);
% U4(i) = Utility_out(4);
% U5(i) = Utility_out(5);

%% Negative exponential utility function
% a = 0.00000009;
a1 = -.00000009;
U1 = -(1/a1)*exp(-a1*yy(ii));

a2 = .00000009;
U2 = -(1/a2)*exp(-a2*yy(ii));

%% 

U3 = yy(ii).^(1/8);



%% Exponential utility function

R1 = 10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U4 = (1-exp(-(yy(ii)-a3)./R1))/(1-exp(-(b1-a3)./R1));

R2 = -10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U5 = (1-exp(-(yy(ii)-a3)./R2))/(1-exp(-(b1-a3)./R2));
end
linespec = {'b','r','c','m','g','y','b-','m-','k','r-'};

% figure(1);
M(jj)=mean(yy);
% Utility_Exp_outcome(jj) = -(1/a)*exp(-a*M(jj));
% [nnn,xoutt] = hist(yy,100);
% 
% plot(xoutt,nnn./trapz(xoutt,nnn),linespec{jj});

[n1,xout1] = hist(U1,1000);
Exp1(jj) = sum(xout1.*n1)/length(U1);

[n2,xout2] = hist(U2,1000);
Exp2(jj) = sum(xout2.*n2)/length(U2);

[n3,xout3] = hist(U3,1000);
Exp3(jj) = sum(xout3.*n3)/length(U3);

[n4,xout4] = hist(U4,1000);
Exp4(jj) = sum(xout4.*n4)/length(U4);

[n5,xout5] = hist(U5,1000);
Exp5(jj) = sum(xout5.*n5)/length(U5);

end


for jj = 3
    x = xx(jj,:);
     
operational_lifetime = 10;
f = x(1);
fup = x(2);
N = x(3);
Pst = x(4);
Pgt = x(5);
Dsat_trans = x(6);
Dsat_rec = x(7);
Dground_rec = x(8);
Dground_trans = x(9);
Sat_long = x(10);
Ground_long = x(11);
Ground_lat = x(12);
Ground_long_r = x(13);
Ground_lat_r = x(14);
Amp = x(15);
Prop_tech = x(16);
Prop = x(17);
Batt = x(18);
SA_material = x(19);
a_e_SA = x(20);
a_e_trans_antenna = x(21);
a_e_rec_antenna = x(22);
a_e_bus = x(23);
eps_rad_battery = x(24);
eps_rad_RW = x(25);
eps_rad_tank = x(26);
bus_config = x(27);
bus_material = x(28);
Prop_tank_material = x(29);
launchsite = x(30);
Launch_vehicle = x(31);
Controller = x(32);
Ant_type = x(33);
Ant_type_ground = x(34);
Power = x(35);
Thermal = x(36);
h = 3.5786000*10^7;
V(jj) = -satellite_objective(x);

for ii = 1:no_of_samples
      r1 = rand(1);
    r2 = rand(1);
    r3 = rand(1);
    r4 = rand(1);
    r5 = rand(1);
    r6 = rand(1);
    r7 = rand(1);
    r8 = rand(1);
    r9 = rand(1);
    r10 = rand(1);
    r11 = rand(1);
    r12 = rand(1);
    r13 = rand(1);
    
pd1 = makedist('Tri',Dsat_trans-0.75*r1,Dsat_trans,Dsat_trans+0.75*r1);
pd2 = makedist('Tri',Dsat_rec-0.75*r2,Dsat_rec,Dsat_rec+0.75*r2);
pd3 = makedist('Tri',Dground_trans-0.75*r3,Dground_trans,Dground_trans+0.75*r3);
pd4 = makedist('Tri',Dground_rec-0.75*r4,Dground_rec,Dground_rec+0.75*r4);
pd5 = makedist('Tri',Sat_long-0.75*r5,Sat_long,Sat_long+0.75*r5);
pd6 = makedist('Tri',Ground_long-0.75*r6,Ground_long,Ground_long+0.75*r6);
pd7 = makedist('Tri',Ground_lat-0.75*r7,Ground_lat,Ground_lat+0.75*r7);
pd8 = makedist('Tri',Ground_long_r-0.75*r8,Ground_long_r,Ground_long_r+0.75*r8);
pd9 = makedist('Tri',Ground_lat_r-0.75*r9,Ground_lat_r,Ground_lat_r+0.75*r9);
pd10 = makedist('Tri',Pst-0.5*r10,Pst,Pst+0.75*r10);
pd11 = makedist('Tri',Pgt-0.5*r11,Pgt,Pgt+0.75*r11);
pd12 = makedist('Tri',f-10^4*r12,f,f+10^4*r12);
pd13 = makedist('Tri',fup-10^4*r13,fup,fup+10^4*r13);


UDsat_trans(ii) = random(pd1,1);
UDsat_rec(ii) = random(pd2,1);
UDground_trans(ii) = random(pd3,1);
UDground_rec(ii) = random(pd4,1);
USat_long(ii) = random(pd5,1);
UGround_long(ii) = random(pd6,1);
UGround_lat(ii) = random(pd7,1);
UGround_long_r(ii) = random(pd8,1);
UGround_lat_r(ii) = random(pd9,1);
UPst(ii) = random(pd10,1);
UPgt(ii) = random(pd11,1);
Uf(ii) = random(pd12,1);
Ufup(ii) = random(pd13,1);

    
    
    x(8) = UDground_rec(ii);
    x(9) = UDground_trans(ii);
    x(7) = UDsat_rec(ii);
    x(6) = UDsat_trans(ii);
    x(12) = UGround_lat(ii);
    x(14) = UGround_lat_r(ii);
    x(11) = UGround_long(ii);
    x(13) = UGround_long_r(ii);
    x(5) = UPgt(ii);
    x(4) = UPst(ii);
    x(10) = USat_long(ii);
    x(1) = Uf(ii);
    x(2) = Ufup(ii);
    
    yy(ii) = -satellite_objective(x);
    
   
% Utility_out = Utility_function(y);
% U1(i) = Utility_out(1);
% U2(i) = Utility_out(2);
% U3(i) = Utility_out(3);
% U4(i) = Utility_out(4);
% U5(i) = Utility_out(5);

%% Negative exponential utility function
% a = 0.00000009;
a1 = -.00000009;
U1 = -(1/a1)*exp(-a1*yy(ii));

a2 = .00000009;
U2 = -(1/a2)*exp(-a2*yy(ii));

%% 

U3 = yy(ii).^(1/8);



%% Exponential utility function

R1 = 10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U4 = (1-exp(-(yy(ii)-a3)./R1))/(1-exp(-(b1-a3)./R1));

R2 = -10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U5 = (1-exp(-(yy(ii)-a3)./R2))/(1-exp(-(b1-a3)./R2));
end
linespec = {'r','b','g','m','g','y','b-','m-','k','r-'};

% figure(1);
M(jj)=mean(yy);
% Utility_Exp_outcome(jj) = -(1/a)*exp(-a*M(jj));
% [nnn,xoutt] = hist(yy,100);
% 
% 
% % plot(xoutt,nnn./trapz(xoutt,nnn),linespec{jj});
% probpro2b = sum(nnn);

[n1,xout1] = hist(U1,1000);
Exp1(jj) = sum(xout1.*n1)/length(U1);

[n2,xout2] = hist(U2,1000);
Exp2(jj) = sum(xout2.*n2)/length(U2);

[n3,xout3] = hist(U3,1000);
Exp3(jj) = sum(xout3.*n3)/length(U3);

[n4,xout4] = hist(U4,1000);
Exp4(jj) = sum(xout4.*n4)/length(U4);

[n5,xout5] = hist(U5,1000);
Exp5(jj) = sum(xout5.*n5)/length(U5);
end


for jj = 4
    x = xx(jj,:);
     
operational_lifetime = 10;
f = x(1);
fup = x(2);
N = x(3);
Pst = x(4);
Pgt = x(5);
Dsat_trans = x(6);
Dsat_rec = x(7);
Dground_rec = x(8);
Dground_trans = x(9);
Sat_long = x(10);
Ground_long = x(11);
Ground_lat = x(12);
Ground_long_r = x(13);
Ground_lat_r = x(14);
Amp = x(15);
Prop_tech = x(16);
Prop = x(17);
Batt = x(18);
SA_material = x(19);
a_e_SA = x(20);
a_e_trans_antenna = x(21);
a_e_rec_antenna = x(22);
a_e_bus = x(23);
eps_rad_battery = x(24);
eps_rad_RW = x(25);
eps_rad_tank = x(26);
bus_config = x(27);
bus_material = x(28);
Prop_tank_material = x(29);
launchsite = x(30);
Launch_vehicle = x(31);
Controller = x(32);
Ant_type = x(33);
Ant_type_ground = x(34);
Power = x(35);
Thermal = x(36);
h = 3.5786000*10^7;
V(jj) = -satellite_objective(x);

for ii = 1:no_of_samples
      r1 = rand(1);
    r2 = rand(1);
    r3 = rand(1);
    r4 = rand(1);
    r5 = rand(1);
    r6 = rand(1);
    r7 = rand(1);
    r8 = rand(1);
    r9 = rand(1);
    r10 = rand(1);
    r11 = rand(1);
    r12 = rand(1);
    r13 = rand(1);
    

pd1 = makedist('Tri',Dsat_trans-0.75*r1,Dsat_trans,Dsat_trans+0.75*r1);
pd2 = makedist('Tri',Dsat_rec-0.75*r2,Dsat_rec,Dsat_rec+0.75*r2);
pd3 = makedist('Tri',Dground_trans-0.75*r3,Dground_trans,Dground_trans+0.75*r3);
pd4 = makedist('Tri',Dground_rec-0.75*r4,Dground_rec,Dground_rec+0.75*r4);
pd5 = makedist('Tri',Sat_long-0.75*r5,Sat_long,Sat_long+0.75*r5);
pd6 = makedist('Tri',Ground_long-0.75*r6,Ground_long,Ground_long+0.75*r6);
pd7 = makedist('Tri',Ground_lat-0.75*r7,Ground_lat,Ground_lat+0.75*r7);
pd8 = makedist('Tri',Ground_long_r-0.75*r8,Ground_long_r,Ground_long_r+0.75*r8);
pd9 = makedist('Tri',Ground_lat_r-0.75*r9,Ground_lat_r,Ground_lat_r+0.75*r9);
pd10 = makedist('Tri',Pst-0.5*r10,Pst,Pst+0.75*r10);
pd11 = makedist('Tri',Pgt-0.5*r11,Pgt,Pgt+0.75*r11);
pd12 = makedist('Tri',f-10^4*r12,f,f+10^4*r12);
pd13 = makedist('Tri',fup-10^4*r13,fup,fup+10^4*r13);


UDsat_trans(ii) = random(pd1,1);
UDsat_rec(ii) = random(pd2,1);
UDground_trans(ii) = random(pd3,1);
UDground_rec(ii) = random(pd4,1);
USat_long(ii) = random(pd5,1);
UGround_long(ii) = random(pd6,1);
UGround_lat(ii) = random(pd7,1);
UGround_long_r(ii) = random(pd8,1);
UGround_lat_r(ii) = random(pd9,1);
UPst(ii) = random(pd10,1);
UPgt(ii) = random(pd11,1);
Uf(ii) = random(pd12,1);
Ufup(ii) = random(pd13,1);
    
    x(8) = UDground_rec(ii);
    x(9) = UDground_trans(ii);
    x(7) = UDsat_rec(ii);
    x(6) = UDsat_trans(ii);
    x(12) = UGround_lat(ii);
    x(14) = UGround_lat_r(ii);
    x(11) = UGround_long(ii);
    x(13) = UGround_long_r(ii);
    x(5) = UPgt(ii);
    x(4) = UPst(ii);
    x(10) = USat_long(ii);
    x(1) = Uf(ii);
    x(2) = Ufup(ii);
    
    yy(ii) = -satellite_objective(x);
    
   
% Utility_out = Utility_function(y);
% U1(i) = Utility_out(1);
% U2(i) = Utility_out(2);
% U3(i) = Utility_out(3);
% U4(i) = Utility_out(4);
% U5(i) = Utility_out(5);

%% Negative exponential utility function
% a = 0.00000009;
a1 = -.00000009;
U1 = -(1/a1)*exp(-a1*yy(ii));

a2 = .00000009;
U2 = -(1/a2)*exp(-a2*yy(ii));

%% 

U3 = yy(ii).^(1/8);



%% Exponential utility function

R1 = 10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U4 = (1-exp(-(yy(ii)-a3)./R1))/(1-exp(-(b1-a3)./R1));

R2 = -10^8;
b1 = 330*10^6;
a3 = -10*10^6;
U5 = (1-exp(-(yy(ii)-a3)./R2))/(1-exp(-(b1-a3)./R2));

    
end
linespec = {'r','b','c','k','g','y','b-','m-','k','r-'};

% figure(1);
M(jj)=mean(yy);
% Utility_Exp_outcome(jj) = -(1/a)*exp(-a*M(jj));
% [nnn,xoutt] = hist(yy,100);
% plot(xoutt,nnn./trapz(xoutt,nnn),linespec{jj});


[n1,xout1] = hist(U1,1000);
Exp1(jj) = sum(xout1.*n1)/length(U1);

[n2,xout2] = hist(U2,1000);
Exp2(jj) = sum(xout2.*n2)/length(U2);

[n3,xout3] = hist(U3,1000);
Exp3(jj) = sum(xout3.*n3)/length(U3);

[n4,xout4] = hist(U4,1000);
Exp4(jj) = sum(xout4.*n4)/length(U4);

[n5,xout5] = hist(U5,1000);
Exp5(jj) = sum(xout5.*n5)/length(U5);

end
% Utility_Exp_outcome
V
M
Exp1
Exp2
Exp3
Exp4
Exp5



toc;
