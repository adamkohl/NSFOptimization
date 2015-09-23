clc
clear all
format longEng
tic;
% x =[99.6526251185886e+009    99.5378677831622e+009    61.1948978496297e+000    5.00071804150287e+000...
% 975.665168618106e+000    197.709367464889e-003    100.228060114849e-003    5.28234999782997e+000...
% 2.22499684449988e+000    282.676558136127e+000    103.460497964079e+000    35.0612925893503e+000...
% 2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
% 3.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000...
% 3.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000...
% 1.00000000000000e+000    3.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
% 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
% 1.00000000000000e+000    1.00000000000000e+000];
% 
% x =[99.6526251185886e+009    99.5378677831622e+009    61.1948978496297e+000    5.00071804150287e+000...
% 975.665168618106e+000    197.709367464889e-003    100.228060114849e-003    5.28234999782997e+000...
% 2.22499684449988e+000    282.676558136127e+000    103.460497964079e+000    35.0612925893503e+000...
% 2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
% 3.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000...
% 3.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000...
% 1.00000000000000e+000    3.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
% 3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
% 1.00000000000000e+000    1.00000000000000e+000];
x =[20e+009    20e+009    50e+000    5 ...
500    1    1    5 ...
5    0    103    35 110 30 ...
1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000...
1.00000000000000e+000    1.00000000000000e+000];
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

[delta011,delta012,delta111,delta112,delta211,delta212,delta221,delta311,delta312,delta321,delta322,...
    dV_dA_011,dV_dA_012,dV_dA_111,dV_dA_112,dV_dA_211,dV_dA_212,dV_dA_221,dV_dA_311,dV_dA_312,dV_dA_321,dV_dA_322] =...
    Scorecard_no_coupling(x);

disp('System level Score card:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta011 dV_dA_011 delta011*dV_dA_011;
      delta012 dV_dA_012 delta012*dV_dA_012]);
  
disp('SSL 1 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta111 dV_dA_111 delta111*dV_dA_111;
      delta112 dV_dA_112 delta112*dV_dA_112]);

disp('SSL 2 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta211 dV_dA_211 delta211*dV_dA_211;
      delta212 dV_dA_212 delta212*dV_dA_212]);
  
disp('SSL 2 SS 2:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta221 dV_dA_221 delta221*dV_dA_221]);  

disp('SSL 3 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta311 dV_dA_311 delta311*dV_dA_311;
      delta312 dV_dA_312 delta312*dV_dA_312]);
  
disp('SSL 3 SS 2:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta321 dV_dA_321 delta321*dV_dA_321;
      delta322 dV_dA_322 delta322*dV_dA_322]); 

[delta011_with,delta012_with,delta111_with,delta112_with,delta211_with,delta212_with,delta221_with,delta311_with,...
    delta312_with,delta321_with,delta322_with,dV_dA_011_with,dV_dA_012_with,dV_dA_111_with,dV_dA_112_with,...
    dV_dA_211_with,dV_dA_212_with,dV_dA_221_with,dV_dA_311_with,dV_dA_312_with,dV_dA_321_with,dV_dA_322_with] =...
    Scorecard_with(x);
disp('------------------------------------------------------------------------')
disp('System level Score card with coupling:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta011_with dV_dA_011_with delta011_with*dV_dA_011_with;
      delta012_with dV_dA_012_with delta012_with*dV_dA_012_with]);
  
disp('SSL 1 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta111_with dV_dA_111_with delta111_with*dV_dA_111_with;
      delta112_with dV_dA_112_with delta112_with*dV_dA_112_with]);

disp('SSL 2 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta211_with dV_dA_211_with delta211_with*dV_dA_211_with;
      delta212_with dV_dA_212_with delta212_with*dV_dA_212_with]);
  
disp('SSL 2 SS 2:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta221_with dV_dA_221_with delta221_with*dV_dA_221_with]);  

disp('SSL 3 SS 1:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta311_with dV_dA_311_with delta311_with*dV_dA_311_with;
      delta312_with dV_dA_312_with delta312_with*dV_dA_312_with]);
  
disp('SSL 3 SS 2:');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([delta321_with dV_dA_321_with delta321_with*dV_dA_321_with;
      delta322_with dV_dA_322_with delta322_with*dV_dA_322_with]); 

toc;