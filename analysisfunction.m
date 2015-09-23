%% Analysis function
function [Eb_No_down,Eb_No_up,Cost_payload,Cost_groundstation,Cost_propulsion,Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv]...
    = analysisfunction(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller)

h = 3.5786000*10^7; 

% Initial guesses
Elevation_new = 10;
Gr_ground_new = 0.01;
V_propellant_new = 0.1;
M_SA_new = 50;
Battery_mass_new = 50;
M_ADCS_new = 20;
P_ADCS_new = 20;
M_thermal_new = 50;
P_Thermal_new = 20;
M_bus_new = 20;
Cost_Engine_per_kg_new = 20;
L_structures_new = 1;
r_structures_new = 0.5;
t_structures_new = 0.1;
hs_new = 1;
ws_new = 0.5;
Ix_structures_new = 10;
Iy_structures_new = 10;
Iz_structures_new = 10;

Elevation_old = 10;
Gr_ground_old = 100;
V_propellant_old = 10;
M_SA_old = 10;
Battery_mass_old = 20;
M_ADCS_old = 10;
P_ADCS_old = 200;
M_thermal_old = 10;
P_Thermal_old = 20;
M_bus_old = 10;
Cost_Engine_per_kg_old = 200;
L_structures_old = 2;
r_structures_old = 2;
t_structures_old = 1;
hs_old = 4;
ws_old = 2;
Ix_structures_old = 100;
Iy_structures_old = 200;
Iz_structures_old = 300;


i = 0;
while(abs(Elevation_old-Elevation_new)>10^-6||...
      abs(Gr_ground_old-Gr_ground_new)>10^-6||...
      abs(V_propellant_old-V_propellant_new)>10^-6||...
      abs(M_SA_old-M_SA_new)>10^-6||...
      abs(Battery_mass_old-Battery_mass_new)>10^-6||...
      abs(M_ADCS_old-M_ADCS_new)>10^-6||...
      abs(P_ADCS_old-P_ADCS_new)>10^-6||...
      abs(M_thermal_old-M_thermal_new)>10^-6||...
      abs(P_Thermal_old-P_Thermal_new)>10^-6||...
      abs(M_bus_old-M_bus_new)>10^-6||...
      abs(Cost_Engine_per_kg_old-Cost_Engine_per_kg_new)>10^-6||...
      abs(L_structures_old-L_structures_new)>10^-6||...
      abs(r_structures_old-r_structures_new)>10^-6||...
      abs(t_structures_old-t_structures_new)>10^-6||...
      abs(hs_old-hs_new)>10^-6||...
      abs(ws_old-ws_new)>10^-6||...
      abs(Ix_structures_old-Ix_structures_new)>10^-6||...
      abs(Iy_structures_old-Iy_structures_new)>10^-6||...
      abs(Iz_structures_old-Iz_structures_new)>10^-6)

      i = i+1;
      
Elevation_old = Elevation_new;
Gr_ground_old = Gr_ground_new;
V_propellant_old = V_propellant_new;
M_SA_old = M_SA_new;
Battery_mass_old = Battery_mass_new;
M_ADCS_old = M_ADCS_new;
P_ADCS_old = P_ADCS_new;
M_thermal_old = M_thermal_new;
P_Thermal_old = P_Thermal_new;
M_bus_old = M_bus_new;
Cost_Engine_per_kg_old = Cost_Engine_per_kg_new;
L_structures_old = L_structures_new;
r_structures_old = r_structures_new;
t_structures_old = t_structures_new;
hs_old = hs_new;
ws_old = ws_new;
Ix_structures_old = Ix_structures_new;
Iy_structures_old = Iy_structures_new;
Iz_structures_old = Iz_structures_new;
      



Payloadoutput_SSL3_SS1 = payload_SSL3_SS1(f,Dsat_trans,Elevation_new,h);
    Gt_sat = Payloadoutput_SSL3_SS1(1);
    L_s = Payloadoutput_SSL3_SS1(2);
    M_payload_t = Payloadoutput_SSL3_SS1(3);
    A = Payloadoutput_SSL3_SS1(4);
Payloadoutput_SSL3_SS2 = payload_SSL3_SS2(fup,Dsat_rec);
    Gr_sat = Payloadoutput_SSL3_SS2(1);
    M_payload_r = Payloadoutput_SSL3_SS2(2);
Payloadoutput_SSL2_SS1 = payload_SSL2_SS1(Amp,Pst,N);
    M_transponders = Payloadoutput_SSL2_SS1(1);
    P_payload = Payloadoutput_SSL2_SS1(2);
    V_trans = Payloadoutput_SSL2_SS1(3);
Payloadoutput_SSL2_SS2 = payload_SSL2_SS2(M_payload_r,M_payload_t);
    M_sat_antenna = Payloadoutput_SSL2_SS2(1);
Payloadoutput_SSL1 = payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gt_sat,Gr_ground_new,L_s,M_transponders,M_sat_antenna);
    Elevation_new = Payloadoutput_SSL1(1);
    Eb_No_down = Payloadoutput_SSL1(2);
    SNRdown = Payloadoutput_SSL1(3);
    Cost_payload = Payloadoutput_SSL1(4);
    M_payload = Payloadoutput_SSL1(5);


Groundoutput_SSL3_SS1 = ground_SSL3_SS1(Elevation_new,fup,h,Dground_trans);
    Gt_ground = Groundoutput_SSL3_SS1(1);
    L_s_up = Groundoutput_SSL3_SS1(2);  
    Aup = Groundoutput_SSL3_SS1(3);  
Groundoutput_SSL3_SS2 = ground_SSL3_SS2(f,Dground_rec);
    Gr_ground_new = Groundoutput_SSL3_SS2(1);
Groundoutput_SSL2_SS1 = ground_SSL2_SS1(Pgt);
    Cost_ground_trans = Groundoutput_SSL2_SS1(1);
Groundoutput_SSL2_SS2 = ground_SSL2_SS2(Dground_trans,Dground_rec);
    Cost_ground_antenna = Groundoutput_SSL2_SS2(1);
Groundoutput_SSL1 = ground_SSL1(Ground_long,Ground_lat,Pgt,fup,L_s_up,Gr_sat,Gt_ground,Cost_ground_antenna,Cost_ground_trans);
    Cost_groundstation = Groundoutput_SSL1(1);
    Eb_No_up = Groundoutput_SSL1(2);
    SNRup = Groundoutput_SSL1(3);


Propulsionoutput_SSL3_SS1 = propulsion_SSL3_SS1(Prop_tank_material,V_propellant_new);
    Cost_prop_tank = Propulsionoutput_SSL3_SS1(1);
    M_propellanttank = Propulsionoutput_SSL3_SS1(2);
    V_propellanttank = Propulsionoutput_SSL3_SS1(3);   
Propulsionoutput_SSL2_SS1 = propulsion_SSL2_SS1(Prop,Prop_tech,M_payload,M_SA_new,Battery_mass_new,M_ADCS_new,M_thermal_new,M_bus_new,Cost_Engine_per_kg_new,M_propellanttank);
    M_propulsion = Propulsionoutput_SSL2_SS1(1);
    V_propellant_new = Propulsionoutput_SSL2_SS1(2);
    Cost_Engine = Propulsionoutput_SSL2_SS1(3);
    Cost_propellant = Propulsionoutput_SSL2_SS1(4);
    M_propellant = Propulsionoutput_SSL2_SS1(5);
Propulsionoutput_SSL1 = propulsion_SSL1(Prop_tech,Cost_Engine,Cost_propellant,Cost_prop_tank);
    Cost_propulsion = Propulsionoutput_SSL1(1);
    Cost_Engine_per_kg_new = Propulsionoutput_SSL1(2);


Poweroutput_SSL2_SS1 = power_SSL2_SS1(SA_material,P_payload,P_ADCS_new,P_Thermal_new);
    Array_size = Poweroutput_SSL2_SS1(1);
    M_SA_new = Poweroutput_SSL2_SS1(2);
    Cost_SA = Poweroutput_SSL2_SS1(3);
Poweroutput_SSL2_SS2 = power_SSL2_SS2(Batt,P_payload,P_ADCS_new,P_Thermal_new);
    Cost_Batt = Poweroutput_SSL2_SS2(1);
    Battery_mass_new = Poweroutput_SSL2_SS2(2);
    V_batt = Poweroutput_SSL2_SS2(3);
    Battery_capacity = Poweroutput_SSL2_SS2(4);
Poweroutput_SSL1 = power_SSL1(Cost_SA,Cost_Batt);
    Cost_power = Poweroutput_SSL1(1);


ADCSoutput_SSL1 = ADCS_SSL1(Controller,M_payload_t,M_payload_r,L_structures_new,r_structures_new,...
    hs_new,ws_new,Dsat_trans,Dsat_rec,Array_size,Ix_structures_new,Iy_structures_new,Iz_structures_new,bus_config,h,M_SA_new);
    Cost_ADCS = ADCSoutput_SSL1(1);
    M_ADCS_new = ADCSoutput_SSL1(2);
    P_ADCS_new = ADCSoutput_SSL1(3);
    M_RW = ADCSoutput_SSL1(4);
    V_RW = ADCSoutput_SSL1(5);


Thermaloutput_SSL2_SS1 = thermal_SSL2_SS1(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,Array_size,...
    Dsat_trans,Dsat_rec,L_structures_new,r_structures_new,hs_new,ws_new,bus_config);
    M_thermalfinish = Thermaloutput_SSL2_SS1(1);
    Cost_thermalfinish = Thermaloutput_SSL2_SS1(2);
Thermaloutput_SSL2_SS2 = thermal_SSL2_SS2(eps_rad_battery,eps_rad_RW,eps_rad_tank,Controller);
    M_radiator = Thermaloutput_SSL2_SS2(1);
    P_Thermal_new = Thermaloutput_SSL2_SS2(2);
    Cost_radiator = Thermaloutput_SSL2_SS2(3);
    Cost_heater = Thermaloutput_SSL2_SS2(4);
Thermaloutput_SSL1 = thermal_SSL1(Cost_thermalfinish,Cost_radiator,Cost_heater,M_radiator,M_thermalfinish);
    Cost_thermal = Thermaloutput_SSL1(1);
    M_thermal_new = Thermaloutput_SSL1(2);


Structuresout_SSL2_SS1 = structures_SSL2_SS1(bus_material);
    ro_bus = Structuresout_SSL2_SS1(1);
    E = Structuresout_SSL2_SS1(2);
    F_tu = Structuresout_SSL2_SS1(3);
    F_ty = Structuresout_SSL2_SS1(4);
    FOS_ulti = Structuresout_SSL2_SS1(5);
    FOS_yield = Structuresout_SSL2_SS1(6);
    Cost_bus_per_kg = Structuresout_SSL2_SS1(7);
Structuresout_SSL1 = structures_SSL1(bus_config,ro_bus,E,F_tu,F_ty,FOS_ulti,FOS_yield,Cost_bus_per_kg,...
    Launch_vehicle,M_ADCS_new,M_thermal_new,M_payload,M_propulsion,M_SA_new,Battery_mass_new,V_trans,V_propellanttank,V_RW,V_batt);
    Cost_structures = Structuresout_SSL1(1);
    M_bus_new = Structuresout_SSL1(2);
    L_structures_new = Structuresout_SSL1(3);
    r_structures_new = Structuresout_SSL1(4);
    t_structures_new = Structuresout_SSL1(5);
    hs_new = Structuresout_SSL1(6);
    ws_new = Structuresout_SSL1(7);
    V_bus = Structuresout_SSL1(8);
    Ix_structures_new = Structuresout_SSL1(9);
    Iy_structures_new = Structuresout_SSL1(10);
    Iz_structures_new = Structuresout_SSL1(11);


Launchvehicleoutput_SSL1 = launchvehicle_SSL1(launchsite,Launch_vehicle,M_propulsion,M_thermal_new,...
    M_SA_new,Battery_mass_new,M_bus_new,M_ADCS_new,M_payload);
    Cost_lv = Launchvehicleoutput_SSL1(1);
    
end


i;

% Gt_sat
% Gr_sat
% Gt_ground
% Gr_ground = Gr_ground_new
% L_s
% L_s_up
% M_payload_t
% M_payload_r
% M_transponders
% P_payload
% V_trans
% M_payload
% Eb_No_down
% Eb_No_up
% Array_size
% M_SA_new
% V_batt
% Battery_mass_new
% M_propulsion
% M_propellanttank
% V_propellanttank
end