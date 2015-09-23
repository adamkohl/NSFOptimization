function [c,ceq] = constraint_function(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
format longEng
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

Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal,GroundLong_r,Ground_lat_r);
  
    Eb_No_down = Sat_system_analysis_out(1);
    Eb_No_up = Sat_system_analysis_out(2);
    L_structures = Sat_system_analysis_out(11);
    r_structures = Sat_system_analysis_out(12);
    hs = Sat_system_analysis_out(13);
    ws = Sat_system_analysis_out(14);
    Spacecraft_mass = Sat_system_analysis_out(15);
    Array_size = Sat_system_analysis_out(16);
 
% if f>10*10^9 | fup>10*10^9
%     A = 10*(6.8966*10^-12*f+0.93103);
%     Aup = 10*(6.8966*10^-12*fup+0.93103);
%     
% %% Composite signal to noise ratio
% Eb_No_composite = Eb_No_up*Eb_No_down/(1+Eb_No_up+Eb_No_down);
% Signal_Noise_dB = 10*log10(Eb_No_composite)-A-Aup;
%     else 
%         Eb_No_composite = Eb_No_up*Eb_No_down/(1+Eb_No_up+Eb_No_down);
% Signal_Noise_dB = 10*log10(Eb_No_composite);
%     end

if f>10*10^9
    A = 10^(10*(6.8966*10^-12*f+0.93103)/10);
    Eb_No_down = Eb_No_down/A;
end
if fup>10*10^9
    Aup = 10^(10*(6.8966*10^-12*fup+0.93103)/10);
    Eb_No_up = Eb_No_up/Aup;
end
    
    Eb_No_composite = Eb_No_up*Eb_No_down/(1+Eb_No_up+Eb_No_down);
    Signal_Noise_dB = 10*log10(Eb_No_composite);
  


ceq = [];

g1 = 10-Signal_Noise_dB;
g2 = Spacecraft_mass-1000;
g3 = Array_size-20;

if bus_config == 1 % cylindrical bus
    g4 = L_structures-5;
    g5 = r_structures-2.5;
elseif bus_config == 2 % rectangular bus
    g4 = hs-5;
    g5 = ws-2.5;
end

% c = [10-Signal_Noise_dB;
%     Spacecraft_mass-1000;
%     Array_size-40;
%     L_structures-5;
%     r_structures-2.5];

c = [g1;g2;g3;g4;g5];
%      c = [10-Signal_Noise_dB]
% c = [g1];
end

