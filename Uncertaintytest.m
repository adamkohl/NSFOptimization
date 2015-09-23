clc
clear all
format longEng

%x = [2	1	1	2	1	11.80534445	3.82890185	0.179536145	0.1	42.91482936	43.70201894	92.23367803	111.2365887...
 %   3	61	1000	1	3	3	2	5.009426816	3	280.4392999	1	2	2	2	2	2	2	1	2	2	9.20E+10	5.90E+10	3];

x = [92000000000	59000000000	61	5.009426816	1000	0.1	0.179536145	11.80534445	3.82890185	280.4392999	92.23367803	42.91482936	111.2365887	43.70201894	2	2	3	2	3	2	2	2	2	2	1	2	2	2	3	3	3	1	1	1	1	1];

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

% 
% operational_lifetime = 10;
% f = x(34);
% fup = x(35);
% N = x(15);
% Pst = x(21);
% Pgt = x(16);
% Dsat_trans = x(9);
% Dsat_rec = x(8);
% Dground_rec = x(6);
% Dground_trans = x(7);
% Sat_long = x(23);
% Ground_long = x(12);
% Ground_lat = x(10);
% Ground_long_r = x(13);
% Ground_lat_r = x(11);
% Amp = x(1);
% Prop_tech = x(20);
% Prop = x(18);
% Batt = x(4);
% SA_material = x(22);
% a_e_SA = x(25);
% a_e_trans_antenna = x(28);
% a_e_rec_antenna = x(27);
% a_e_bus = x(26);
% eps_rad_battery = x(33);
% eps_rad_RW = x(31);
% eps_rad_tank = x(32);
% bus_config = x(29);
% bus_material = x(30);
% Prop_tank_material = x(19);
% launchsite = x(36);
% Launch_vehicle = x(14);
% Controller = x(5);
% Ant_type = x(2);
% Ant_type_ground = x(3);
% Power = x(17);
% Thermal = x(24);
% h = 3.5786000*10^7;


for i = 1:1000
    UDground_rec(i) = normrnd(Dground_rec,0.01);
    UDground_trans(i) = normrnd(Dground_trans,0.01);
    UDsat_rec(i) = normrnd(Dsat_rec,0.01);
    UDsat_trans(i) = normrnd(Dsat_trans,0.01);
    UGround_lat(i) = normrnd(Ground_lat,0.01);
    UGround_lat_r(i) = normrnd(Ground_lat_r,0.01);
    UGround_long(i) = normrnd(Ground_long,0.01);
    UGround_long_r(i) = normrnd(Ground_long_r,0.01);
    UPgt(i) = normrnd(Pgt,0.01);
    UPst(i) = normrnd(Pst,0.01);
    USat_long(i) = normrnd(Sat_long,0.01);
    Uf(i) = normrnd(f,0.01);
    Ufup(i) = normrnd(fup,0.01);
    
    x(6) = UDground_rec;
    x(7) = UDground_trans;
    x(8) = UDsat_rec;
    x(9) = UDsat_trans;
    x(10) = UGround_lat;
    x(11) = UGround_lat_r;
    x(12) = UGround_long;
    x(13) = UGround_long_r;
    x(16) = UPgt;
    x(21) = UPst;
    x(23) = USat_long;
    x(34) = Uf;
    x(35) = Ufup;
        
    satellite_objective(x);
end



% figure;
% [n,xout] = hist(Dground_rec,100);
% hist(Dground_rec)
% plot(xout,n);

