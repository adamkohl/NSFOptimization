function Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal,Ground_long_r,Ground_lat_r)

h = 3.5786000*10^7; 


Gr_ground_new = 1;
M_SA_new = 100;
Battery_mass_new = 100;
M_ADCS_new = 100;
M_thermal_new = 100;
M_bus_new = 100;
P_ADCS_new = 100;
P_Thermal_new = 100;
L_structures_new = 1;
r_structures_new = 0.5;
hs_new = 1;
ws_new = 0.5;
Ix_structures_new = 1;
Iy_structures_new = 1;
Iz_structures_new = 1;

Gr_ground_old = 0;
M_SA_old = 0;
Battery_mass_old = 0;
M_ADCS_old = 0;
M_thermal_old = 0;
M_bus_old = 0;
P_ADCS_old = 0;
P_Thermal_old = 0;
L_structures_old = 0;
r_structures_old = 0;
hs_old = 0;
ws_old = 0;
Ix_structures_old = 0;
Iy_structures_old = 0;
Iz_structures_old = 0;


i = 0;
while (abs(Gr_ground_old-Gr_ground_new)>10^-6||...
        abs(M_SA_old-M_SA_new)>10^-6||...
        abs(Battery_mass_old-Battery_mass_new)>10^-6||...
        abs(M_ADCS_old-M_ADCS_new)>10^-6||...
        abs(M_thermal_old-M_thermal_new)>10^-6||...
        abs(M_bus_old-M_bus_new)>10^-6||...
        abs(P_ADCS_old-P_ADCS_new)>10^-6||...
        abs(P_Thermal_old-P_Thermal_new)>10^-6||...
        abs(L_structures_old-L_structures_new)>10^-6||...
        abs(r_structures_old-r_structures_new)>10^-6||...
        abs(hs_old-hs_new)>10^-6||...
        abs(ws_old-ws_new)>10^-6||...
        abs(Ix_structures_old-Ix_structures_new)>10^-6||...
        abs(Iy_structures_old-Iy_structures_new)>10^-6||...
        abs(Iz_structures_old-Iz_structures_new)>10^-6)
    
    i = i+1;
    Gr_ground_old = Gr_ground_new;
    M_SA_old = M_SA_new;
    Battery_mass_old = Battery_mass_new;
    M_ADCS_old = M_ADCS_new;
    M_thermal_old = M_thermal_new;
    M_bus_old = M_bus_new;
    P_ADCS_old = P_ADCS_new;
    P_Thermal_old = P_Thermal_new;
    L_structures_old = L_structures_new;
    r_structures_old = r_structures_new;
    hs_old = hs_new;
    ws_old = ws_new;
    Ix_structures_old = Ix_structures_new;
    Iy_structures_old = Iy_structures_new;
    Iz_structures_old = Iz_structures_new;
    
    
Payloadoutput_SSL1 = payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground_new,Ant_type,f,fup,Dsat_trans,Dsat_rec,Ground_long_r,Ground_lat_r);
    Elevation = Payloadoutput_SSL1(1);
    Cost_payload = Payloadoutput_SSL1(2);
    Eb_No_down = Payloadoutput_SSL1(3);
    M_transponders = Payloadoutput_SSL1(4);
    V_trans = Payloadoutput_SSL1(5);
    P_payload = Payloadoutput_SSL1(6);
    M_sat_antenna = Payloadoutput_SSL1(7);
    Gt_sat = Payloadoutput_SSL1(8);
    L_s = Payloadoutput_SSL1(9);
    M_payload_t = Payloadoutput_SSL1(10);
    Gr_sat = Payloadoutput_SSL1(11);
    M_payload_r = Payloadoutput_SSL1(12);
    M_payload = Payloadoutput_SSL1(13);
    Cost_sat_antenna = Payloadoutput_SSL1(14);
    SNRdown = Payloadoutput_SSL1(15);
    Elevation_r = Payloadoutput_SSL1(15);
    
Groundoutput_SSL1 = ground_SSL1(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground,Elevation_r,Ground_long_r,Ground_lat_r);
    Cost_groundstation = Groundoutput_SSL1(1);
    Eb_No_up = Groundoutput_SSL1(2);
    Cost_ground_trans = Groundoutput_SSL1(3);
    Cost_ground_antenna = Groundoutput_SSL1(4);
    Gt_ground = Groundoutput_SSL1(5);
    L_s_up = Groundoutput_SSL1(6);
    Gr_ground_new = Groundoutput_SSL1(7);
    SNRup = Groundoutput_SSL1(10);
    M_ground_t = Groundoutput_SSL1(8);
    M_ground_r = Groundoutput_SSL1(9);

Propulsionoutput_SSL1 = propulsion_SSL1(Prop,Prop_tech,Prop_tank_material,...
    M_payload,M_SA_new,Battery_mass_new,M_ADCS_new,M_thermal_new,M_bus_new);
    Cost_propulsion = Propulsionoutput_SSL1(1);
    Cost_Engine_per_kg = Propulsionoutput_SSL1(2);
    M_propulsion = Propulsionoutput_SSL1(3);
    V_propellant = Propulsionoutput_SSL1(4);
    Cost_Engine = Propulsionoutput_SSL1(5);
    Cost_propellant = Propulsionoutput_SSL1(6);
    M_propellant = Propulsionoutput_SSL1(7);
    Cost_prop_tank = Propulsionoutput_SSL1(8);
    M_propellanttank = Propulsionoutput_SSL1(9);
    V_propellanttank = Propulsionoutput_SSL1(10);

Poweroutput_SSL1 = power_SSL1(P_payload,P_ADCS_new,P_Thermal_new,Power,SA_material,Batt);
    Cost_power = Poweroutput_SSL1(1);
    Array_size = Poweroutput_SSL1(2);
    M_SA_new = Poweroutput_SSL1(3);
    Cost_SA = Poweroutput_SSL1(4);
    Cost_Batt = Poweroutput_SSL1(5);
    Battery_mass_new = Poweroutput_SSL1(6);
    V_batt = Poweroutput_SSL1(7);
    Battery_capacity = Poweroutput_SSL1(8);

ADCSoutput_SSL1 = ADCS_SSL1(Controller,M_payload_t,M_payload_r,L_structures_new,r_structures_new,...
    hs_new,ws_new,Dsat_trans,Dsat_rec,Array_size,Ix_structures_new,Iy_structures_new,Iz_structures_new,bus_config,h,M_SA_new);
    Cost_ADCS = ADCSoutput_SSL1(1);
    M_ADCS_new = ADCSoutput_SSL1(2);
    P_ADCS_new = ADCSoutput_SSL1(3);
    M_RW = ADCSoutput_SSL1(4);
    V_RW = ADCSoutput_SSL1(5);

Thermaloutput_SSL1 = thermal_SSL1(Thermal,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures_new,r_structures_new,hs_new,ws_new,bus_config);
    Cost_thermal = Thermaloutput_SSL1(1);
    M_thermal_new = Thermaloutput_SSL1(2);
    M_thermalfinish = Thermaloutput_SSL1(3);
    Cost_thermalfinish = Thermaloutput_SSL1(4);
    M_radiator = Thermaloutput_SSL1(5);
    P_Thermal_new = Thermaloutput_SSL1(6);
    Cost_radiator = Thermaloutput_SSL1(7);
    Cost_heater = Thermaloutput_SSL1(8);

Structuresout_SSL1 = structures_SSL1(bus_config,Launch_vehicle,M_ADCS_new,M_thermal_new,M_payload,M_propulsion,...
    M_SA_new,Battery_mass_new,V_trans,V_propellant,V_RW,V_batt,bus_material);
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
    ro_bus = Structuresout_SSL1(12);
    E = Structuresout_SSL1(13);
    F_tu = Structuresout_SSL1(14);
    F_ty = Structuresout_SSL1(15);
    Cost_bus_per_kg = Structuresout_SSL1(18);

Launchvehicleoutput_SSL1 = launchvehicle_SSL1(launchsite,Launch_vehicle,M_propulsion,M_thermal_new,...
    M_SA_new,Battery_mass_new,M_bus_new,M_ADCS_new,M_payload);
    Cost_lv = Launchvehicleoutput_SSL1(1);
    
    Spacecraft_mass = M_propulsion+M_thermal_new+M_SA_new+Battery_mass_new+M_bus_new+M_ADCS_new+M_payload;
end
Sat_system_analysis_out = [Eb_No_down,Eb_No_up,Cost_payload,Cost_groundstation,Cost_propulsion,Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv...
    L_structures_new,r_structures_new,hs_new,ws_new,Spacecraft_mass,Array_size,SNRdown,SNRup,M_transponders,...
    P_payload,Cost_sat_antenna,Gt_sat,L_s,M_payload_t,Gr_sat,M_payload_r,Cost_Engine_per_kg,V_trans,M_sat_antenna,Cost_ground_trans,Cost_ground_antenna,Cost_SA,Array_size,M_SA_new,...
    Cost_Batt,Battery_mass_new,Battery_capacity,V_batt,Cost_Engine,Cost_propellant,Cost_thermalfinish,M_thermalfinish,P_Thermal_new,Cost_radiator,Cost_heater,M_radiator,...
    ro_bus,E,Cost_bus_per_kg,F_ty,F_tu,M_ground_t,Gt_ground,L_s_up,M_ground_r,Gr_ground_new,M_propellanttank,V_propellanttank,Cost_prop_tank];
end