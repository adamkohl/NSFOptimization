function Thermal_io = thermalanalysis(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config,Thermal)


Cost_thermalfinish_new = 100;
Cost_radiator_new = 100;
M_radiator_new = 100;
M_thermalfinish_new = 100;
Cost_heater_new = 100;

Cost_thermalfinish_old = 0;
Cost_radiator_old = 0;
M_radiator_old = 0;
M_thermalfinish_old = 0;
Cost_heater_old = 0;

i = 0;
while (abs(Cost_thermalfinish_old-Cost_thermalfinish_new)>10^-6||...
        abs(Cost_radiator_old-Cost_radiator_new)>10^-6||...
        abs(M_radiator_old-M_radiator_new)>10^-6||...
        abs(M_thermalfinish_old-M_thermalfinish_new)>10^-6||...
        abs(Cost_heater_old-Cost_heater_new)>10^-6)

    i = i+1;
    Cost_thermalfinish_old = Cost_thermalfinish_new;
    Cost_radiator_old = Cost_radiator_new;
    M_radiator_old = M_radiator_new;
    M_thermalfinish_old = M_thermalfinish_new;
    Cost_heater_old = Cost_heater_new;
    
Thermal_SSL1_io = thermal_SSL1_analysis(Cost_thermalfinish_new,Cost_radiator_new,Cost_heater_new,M_radiator_new,M_thermalfinish_new,...
    Array_size,L_structures,r_structures,hs,ws,Thermal);
    Cost_thermal = Thermal_SSL1_io(1);
    M_thermal = Thermal_SSL1_io(2);
    Array_size_1 = Thermal_SSL1_io(3);
    L_structures_1 = Thermal_SSL1_io(4);
    r_structures_1 = Thermal_SSL1_io(5);
    hs_1 = Thermal_SSL1_io(6);
    ws_1 = Thermal_SSL1_io(7);
Thermal_SSL2_io = thermal_SSL2_analysis(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size_1,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config);
    M_thermalfinish_new = Thermal_SSL2_io(1);
    Cost_thermalfinish_new = Thermal_SSL2_io(2);
    M_radiator_new = Thermal_SSL2_io(3);
    P_Thermal = Thermal_SSL2_io(4);
    Cost_radiator_new = Thermal_SSL2_io(5);
    Cost_heater_new = Thermal_SSL2_io(6);
end

Thermal_io = [Cost_thermal M_thermal M_thermalfinish_new Cost_thermalfinish_new M_radiator_new P_Thermal Cost_radiator_new Cost_heater_new];
end