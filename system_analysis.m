function System_analysis = system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal)

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

Payload_io = payloadanalysis(f,fup,N,Pst,Dsat_trans,Dsat_rec,Sat_long,Ground_long,Ground_lat,...
    Amp,Gr_ground_new,Ant_type);
    Elevation = Payload_io(1);
    Cost_payload = Payload_io(2);
    Eb_No_down = Payload_io(3);
    M_transponders = Payload_io(4);
    V_trans = Payload_io(5);
    P_payload = Payload_io(6);
    M_sat_antenna = Payload_io(7);
    Gt_sat = Payload_io(8);
    L_s = Payload_io(9);
    M_payload_t = Payload_io(10);
    Gr_sat = Payload_io(11);
    M_payload_r = Payload_io(12);
    M_payload = Payload_io(13);
    Cost_sat_antenna = Payload_io(14);
Ground_io = groundanalysis(f,fup,Pgt,Ground_long,Ground_lat,Dground_trans,Dground_rec,...
    Elevation,Gr_sat,Ant_type_ground);
    Cost_groundstation = Ground_io(1);
    Eb_No_up = Ground_io(2);
    Cost_ground_trans = Ground_io(3);
    Cost_ground_antenna = Ground_io(4);
    Gt_ground = Ground_io(5);
    L_s_up = Ground_io(6);
    Gr_ground_new = Ground_io(7);
Propulsion_io = propulsionanalysis(Prop,Prop_tech,Prop_tank_material,M_payload,M_SA_new,Battery_mass_new,M_ADCS_new,M_thermal_new,M_bus_new);
    Cost_propulsion = Propulsion_io(1);
    Cost_Engine_per_kg = Propulsion_io(2);
    M_propulsion = Propulsion_io(3);
    V_propellant = Propulsion_io(4);
    Cost_Engine = Propulsion_io(5);
    Cost_propellant = Propulsion_io(6);
    M_propellant = Propulsion_io(7);
    Cost_prop_tank = Propulsion_io(8);
    M_propellanttank = Propulsion_io(9);
    V_propellanttank = Propulsion_io(10);
Power_io = poweranalysis(SA_material,Batt,P_payload,P_ADCS_new,P_Thermal_new,Power);
    Cost_power = Power_io(1);
    Array_size = Power_io(2);
    M_SA_new = Power_io(3);
    Cost_SA = Power_io(4);
    Cost_Batt = Power_io(5);
    Battery_mass_new = Power_io(6);
    V_batt = Power_io(7);
    Battery_capacity = Power_io(8);
ADCS_io = ADCSanalysis(Controller,M_payload_t,M_payload_r,L_structures_new,r_structures_new,...
    hs_new,ws_new,Dsat_trans,Dsat_rec,Array_size,Ix_structures_new,Iy_structures_new,Iz_structures_new,bus_config,h,M_SA_new);
    Cost_ADCS = ADCS_io(1);
    M_ADCS_new = ADCS_io(2);
    P_ADCS_new = ADCS_io(3);
    M_RW = ADCS_io(4);
    V_RW = ADCS_io(5);
Thermal_io = thermalanalysis(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures_new,r_structures_new,hs_new,ws_new,bus_config,Thermal);
    Cost_thermal = Thermal_io(1);
    M_thermal_new = Thermal_io(2);
    M_thermalfinish = Thermal_io(3);
    Cost_thermalfinish = Thermal_io(4);
    M_radiator = Thermal_io(5);
    P_Thermal_new = Thermal_io(6);
    Cost_radiator = Thermal_io(7);
    Cost_heater = Thermal_io(8);
    
Structures_io = structuresanalysis(bus_config,bus_material,Launch_vehicle,M_ADCS_new,M_thermal_new,M_payload,M_propulsion,M_SA_new,Battery_mass_new,...
                                            V_trans,V_propellanttank,V_RW,V_batt);
    Cost_structures = Structures_io(1);
    M_bus_new = Structures_io(2);
    L_structures_new = Structures_io(3);
    r_structures_new = Structures_io(4);
    t_structures_new = Structures_io(5);
    hs_new = Structures_io(6);
    ws_new = Structures_io(7);
    V_bus = Structures_io(8);
    Ix_structures_new = Structures_io(9);
    Iy_structures_new = Structures_io(10);
    Iz_structures_new = Structures_io(11);
    ro_bus = Structures_io(12);
    E = Structures_io(13);
    F_tu = Structures_io(14);
    F_ty = Structures_io(15);
    Cost_bus_per_kg = Structures_io(18);
    
Launchvehicle_io = launchvehicleanalysis(launchsite,Launch_vehicle,M_propulsion,M_thermal_new,...
    M_SA_new,Battery_mass_new,M_bus_new,M_ADCS_new,M_payload);
    Cost_lv = Launchvehicle_io(1);
end
System_analysis =[Eb_No_down,Eb_No_up,Cost_payload,Cost_groundstation,Cost_propulsion,Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv];
end