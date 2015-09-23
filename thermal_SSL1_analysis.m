function Thermal_SSL1_io = thermal_SSL1_analysis(Thermal,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config)

Thermaloutput_SSL1 = thermal_SSL1(Thermal,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config);
    Cost_thermal = Thermaloutput_SSL1(1);
    M_thermal = Thermaloutput_SSL1(2);
    M_thermalfinish = Thermaloutput_SSL1(3);
    Cost_thermalfinish = Thermaloutput_SSL1(4);
    M_radiator = Thermaloutput_SSL1(5);
    P_Thermal = Thermaloutput_SSL1(6);
    Cost_radiator = Thermaloutput_SSL1(7);
    Cost_heater = Thermaloutput_SSL1(8);

Thermal_SSL1_io = [Cost_thermal M_thermal M_thermalfinish Cost_thermalfinish M_radiator P_Thermal Cost_radiator Cost_heater];
end