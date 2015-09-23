function Structures_SSL1_io = structures_SSL1_analysis(bus_config,Launch_vehicle,M_ADCS,M_thermal,M_payload,M_propulsion,...
    M_SA,Battery_mass,V_trans,V_propellanttank,V_RW,V_batt,bus_material)

Structuresout_SSL1 = structures_SSL1(bus_config,Launch_vehicle,M_ADCS,M_thermal,M_payload,M_propulsion,...
    M_SA,Battery_mass,V_trans,V_propellanttank,V_RW,V_batt,bus_material);
    Cost_structures = Structuresout_SSL1(1);
    M_bus = Structuresout_SSL1(2);
    L_structures = Structuresout_SSL1(3);
    r_structures = Structuresout_SSL1(4);
    t_structures = Structuresout_SSL1(5);
    hs = Structuresout_SSL1(6);
    ws = Structuresout_SSL1(7);
    V_bus = Structuresout_SSL1(8);
    Ix_structures = Structuresout_SSL1(9);
    Iy_structures = Structuresout_SSL1(10);
    Iz_structures = Structuresout_SSL1(11);
    ro_bus = Structuresout_SSL1(12);
    E = Structuresout_SSL1(13);
    F_tu = Structuresout_SSL1(14);
    F_ty = Structuresout_SSL1(15);
    FOS_ulti = Structuresout_SSL1(16);
    FOS_yield = Structuresout_SSL1(17);
    Cost_bus_per_kg = Structuresout_SSL1(18);
    
    Structures_SSL1_io = [Cost_structures M_bus L_structures r_structures t_structures hs ws V_bus Ix_structures Iy_structures Iz_structures...
                        ro_bus E F_tu F_ty Cost_bus_per_kg]; 
end