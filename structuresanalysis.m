function Structures_io = structuresanalysis(bus_config,bus_material,Launch_vehicle,M_ADCS,M_thermal,M_payload,M_propulsion,M_SA,Battery_mass,...
                                            V_trans,V_propellanttank,V_RW,V_batt)

                                        
ro_bus_new = 1000;
E_new = 10^7;
F_tu_new = 10^6;
F_ty_new = 10^6;
FOS_ulti_new = 2;
FOS_yield_new = 1.6;
Cost_bus_per_kg_new = 100;

ro_bus_old = 2000;
E_old = 10^6;
F_tu_old = 10^5;
F_ty_old = 10^5;
FOS_ulti_old = 2.5;
FOS_yield_old = 2;
Cost_bus_per_kg_old = 1000;

i = 0;
while (abs(ro_bus_old-ro_bus_new)>10^-6||...
        abs(E_old-E_new)>10^-6||...
        abs(F_tu_old-F_tu_new)>10^-6||...
        abs(F_ty_old-F_ty_new)>10^-6||...
        abs(FOS_ulti_old-FOS_ulti_new)>10^-6||...
        abs(FOS_yield_old-FOS_yield_new)>10^-6||...
        abs(Cost_bus_per_kg_old-Cost_bus_per_kg_new)>10^-6)
    
    i = i+1;
    ro_bus_old = ro_bus_new;
    E_old = E_new;
    F_tu_old = F_tu_new;
    F_ty_old = F_ty_new;
    FOS_ulti_old = FOS_ulti_new;
    FOS_yield_old = FOS_yield_new;
    Cost_bus_per_kg_old = Cost_bus_per_kg_new;

Structures_SSL1_io = structures_SSL1_analysis(bus_config,ro_bus_new,E_new,F_tu_new,F_ty_new,FOS_ulti_new,FOS_yield_new,Cost_bus_per_kg_new,...
    Launch_vehicle,M_ADCS,M_thermal,M_payload,M_propulsion,M_SA,Battery_mass,V_trans,V_propellanttank,V_RW,V_batt);
    Cost_structures = Structures_SSL1_io(1);
    M_bus = Structures_SSL1_io(2);
    L_structures = Structures_SSL1_io(3);
    r_structures = Structures_SSL1_io(4);
    t_structures = Structures_SSL1_io(5);
    hs = Structures_SSL1_io(6);
    ws = Structures_SSL1_io(7);
    V_bus = Structures_SSL1_io(8);
    Ix_structures = Structures_SSL1_io(9);
    Iy_structures = Structures_SSL1_io(10);
    Iz_structures = Structures_SSL1_io(11);
    
    
Structures_SSL2_io = structures_SSL2_analysis(bus_material);
    ro_bus_new = Structures_SSL2_io(1);
    E_new = Structures_SSL2_io(2);
    F_tu_new = Structures_SSL2_io(3);
    F_ty_new = Structures_SSL2_io(4);
    FOS_ulti_new = Structures_SSL2_io(5);
    FOS_yield_new = Structures_SSL2_io(6);
    Cost_bus_per_kg_new = Structures_SSL2_io(7);
end

Structures_io = [Cost_structures M_bus L_structures r_structures t_structures hs ws V_bus Ix_structures Iy_structures Iz_structures...
                ro_bus_new E_new F_tu_new F_ty_new Cost_bus_per_kg_new];
end