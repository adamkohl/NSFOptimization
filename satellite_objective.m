%% Objective function
function [y,P,S] = satellite_objective(x)


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



% lb = [10^9 10^9 10 5 300 0.1 0.1 2 2 0 66 25 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
% ub = [100*10^9 100*10^9 100 300 10000 5 5 20 20 360 125 50 2 2 4 3 3 4 4 4 4 2 2 2 2 4 3 3 4 2];
% intCon = [13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];



Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal,Ground_long_r,Ground_lat_r);
  Eb_No_down = Sat_system_analysis_out(1);
  Eb_No_up = Sat_system_analysis_out(2);
  Cost_payload = Sat_system_analysis_out(3);
  Cost_groundstation = Sat_system_analysis_out(4);
  Cost_propulsion = Sat_system_analysis_out(5);
  Cost_power = Sat_system_analysis_out(6);
  Cost_ADCS= Sat_system_analysis_out(7);
  Cost_thermal = Sat_system_analysis_out(8);
  Cost_structures = Sat_system_analysis_out(9);
  Cost_lv = Sat_system_analysis_out(10);
  Spacecraft_mass = Sat_system_analysis_out(15);
  SNRdown = Sat_system_analysis_out(17);
  SNRup = Sat_system_analysis_out(18);
  
  
  
Satsystemout = satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
    Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup);
Revenue = Satsystemout(1:10);
Total_revenue = Satsystemout(11);
Total_cost = Satsystemout(12);

Valueout = valuefunction(Total_cost,Revenue);

% Objective functions
    % Value function
        y = -Valueout(1);
        P = Cost_payload;
        S = Cost_structures;
    % Traditional objective functions
%         y = Spacecraft_mass
%         y = Total_cost;
%         w1 = 0.2;
%         w2 = 0.8;
%         y = w1*Spacecraft_mass - w2*N 
x;
end