Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal,Ground_long_r,Ground_lat_r);

% Subsystem LEVEL 1
  Eb_No_down = Sat_system_analysis_out(1);
  Eb_No_up = Sat_system_analysis_out(2);
  %SS1 Payload
  Cost_payload = Sat_system_analysis_out(3);
  %SS2 Ground Station
  Cost_groundstation = Sat_system_analysis_out(4);
  %SS3 Power
  Cost_power = Sat_system_analysis_out(6);
  %SS4 Propulsion
  Cost_propulsion = Sat_system_analysis_out(5);
  Cost_Engine_per_kg = Sat_system_analysis_out(27);
  %SS5 ADCS
  Cost_ADCS= Sat_system_analysis_out(7);
  %SS6 Thermal
  Cost_thermal = Sat_system_analysis_out(8);
  %SS7 Structures
  Cost_structures = Sat_system_analysis_out(9);
  %SS8 Launch Vehicle
  Cost_lv = Sat_system_analysis_out(10);

% Subsystem LEVEL 2
  %SS1 Satellite Transponders
    M_transponders = Sat_system_analysis_out(19);  
    P_payload = Sat_system_analysis_out(20);
    V_trans = Sat_system_analysis_out(28);
  %SS2 Satellite Antennae
    Cost_sat_antenna = Sat_system_analysis_out(21);
    M_sat_antenna = Sat_system_analysis_out(29);
  %SS3 Ground Transponder
    Cost_ground_trans = Sat_system_analysis_out(30);
  %SS4 Ground Antenna
    Cost_ground_antenna = Sat_system_analysis_out(31);
  %SS5 Solar Array
    Cost_SA = Sat_system_analysis_out(32);
    Array_size = Sat_system_analysis_out(33);
    M_SA_new = Sat_system_analysis_out(34);
  %SS6 Battery
    Cost_batt = Sat_system_analysis_out(35);
    Battery_mass_new = Sat_system_analysis_out(36);
    Battery_capacity = Sat_system_analysis_out(37);
    V_batt = Sat_system_analysis_out(38);
  %SS7 Propellant
    Cost_Engine = Sat_system_analysis_out(39);
    Cost_propellant = Sat_system_analysis_out(40);
  %SS8 Surface Finish
    Cost_thermalfinish = Sat_system_analysis_out(41);
    M_thermalfinish = Sat_system_analysis_out(42);
  %SS9 Radiator and Heater
    P_Thermal_new = Sat_system_analysis_out(43);
    Cost_radiator = Sat_system_analysis_out(44);
    Cost_heater = Sat_system_analysis_out(45);
    M_radiator = Sat_system_analysis_out(46);
  %SS10 Bus
    ro_bus = Sat_system_analysis_out(47);
    E = Sat_system_analysis_out(48);
    Cost_bus_per_kg = Sat_system_analysis_out(49);
    F_ty = Sat_system_analysis_out(50);
    F_tu = Sat_system_analysis_out(51);

%Subsystem LEVEL 3
   %SS1 Satellite Transmitting Antenna
    Gt_sat = Sat_system_analysis_out(22);
    L_s = Sat_system_analysis_out(23);
    M_payload_t = Sat_system_analysis_out(24);
   %SS2 Satellite Receiving Antenna
    Gr_sat = Sat_system_analysis_out(25);
    M_payload_r = Sat_system_analysis_out(26);
   %SS3 Ground Transmitting Antenna
    M_ground_t = Sat_system_analysis_out(52);
    Gt_ground = Sat_system_analysis_out(53);
    L_s_up = Sat_system_analysis_out(54);
   %SS4 Ground Receiving Antenna
    M_ground_r = Sat_system_analysis_out(55);
    Gr_ground_new = Sat_system_analysis_out(56);
   %SS5 Propellant Tank
    M_propellanttank = Sat_system_analysis_out(57);
    V_propellanttank = Sat_system_analysis_out(58);
    Cost_prop_tank = Sat_system_analysis_out(59);
  
    
    
Spacecraft_mass = Sat_system_analysis_out(15);
SNRdown = Sat_system_analysis_out(17);
SNRup = Sat_system_analysis_out(18);

  
  
  
Satsystemout = satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
    Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup);

Revenue = Satsystemout(1:10);
Total_revenue = Satsystemout(11);
Total_cost = Satsystemout(12);
SNR=Satsystemout(13);

%Constraint Function
g1 = 10-SNR;
g2 = Spacecraft_mass-1000;
g3 = Array_size-40;

L_structures = Sat_system_analysis_out(11);
r_structures = Sat_system_analysis_out(12);
hs = Sat_system_analysis_out(13);
ws = Sat_system_analysis_out(14);
    
if bus_config == 1 % cylindrical bus
    g4 = L_structures-5;
    g5 = r_structures-2.5;
elseif bus_config == 2 % rectangular bus
    g4 = hs-5;
    g5 = ws-2.5;
end

Valueout = valuefunction(Total_cost,Revenue);


 % Value function
        y = Valueout(1)
 % Traditional objective functions
    Spacecraft_mass
        w1 = .2;
        w2 = .8;
        multiobj = w1*Spacecraft_mass - w2*N 

        value=y

