function [] = ...
    Scorecard_with_coupling(x)

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
Amp = x(13);
Prop_tech = x(14);
Prop = x(15);
Batt = x(16);
SA_material = x(17);
a_e_SA = x(18);
a_e_trans_antenna = x(19);
a_e_rec_antenna = x(20);
a_e_bus = x(21);
eps_rad_battery = x(22);
eps_rad_RW = x(23);
eps_rad_tank = x(24);
bus_config = x(25);
bus_material = x(26);
Prop_tank_material = x(27);
launchsite = x(28);
Launch_vehicle = x(29);
Controller = x(30);
Ant_type = x(31);
Ant_type_ground = x(32);
Power = x(33);
Thermal = x(34);


Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal);
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
  
  
%% System level score card
dV_dA_111 = 1;
dV_dA_112 = 1;

delta111 = 1;
delta112 = 1;

%% SSL 1 Score card
 % SSL 1 SS 1

    delta211 = 1;
    delta212 = -10;
    delta213 = 2;
    
    
    dA_111_dA_211 = 1;
    dV_dA_211 = dV_dA_111 * dA_111_dA_211;
    
    dsatsystem_dA_212 = (satsystem(N+delta212,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta212;
    dsatsystem_dA_231 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power+delta231,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta231;
    dCpower_dA_212 = (satsystem(N+delta212,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta212;
    dA_111_dA_231 = dsatsystem_dA_213(3);
    dA_112_dA_231 = dsatsystem_dA_213(2);  
    dA_111_dA_212 = dsatsystem_dA_212(3);
    dA_112_dA_212 = dsatsystem_dA_212(2);
    dV_dA_212 = (dV_dA_111 * dA_111_dA_212) + (dV_dA_112 * dA_112_dA_212) + (dV_dA_111 * dA_111_dA_231 * dA_231_dA_212) + ...
                (dV_dA_112 * dA_112_dA_231 * dA_231_dA_212);
    
    dsatsystem_dA_213 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown+delta213,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta213;
    dA_111_dA_213 = dsatsystem_dA_213(3);
    dA_112_dA_213 = dsatsystem_dA_213(2);
    
    dV_dA_213 = (dV_dA_111 * dA_111_dA_213) + (dV_dA_112 * dA_112_dA_213);
    
    % SSL 1 SS 3
    
    delta231 = -10;
    
    dsatsystem_dA_231 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power+delta231,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta231;
    dA_111_dA_231 = dsatsystem_dA_213(3);
    dA_112_dA_231 = dsatsystem_dA_213(2);                
    dV_dA_231 = (dV_dA_111 * dA_111_dA_231) + (dV_dA_112 * dA_112_dA_231);
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end