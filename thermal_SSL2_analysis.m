function Thermal_SSL2_io = thermal_SSL2_analysis(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config)

Thermaloutput_SSL2_SS1 = thermal_SSL2_SS1(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,Array_size,...
    Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config);
    M_thermalfinish = Thermaloutput_SSL2_SS1(1);
    Cost_thermalfinish = Thermaloutput_SSL2_SS1(2);
Thermaloutput_SSL2_SS2 = thermal_SSL2_SS2(eps_rad_battery,eps_rad_RW,eps_rad_tank,Controller);
    M_radiator = Thermaloutput_SSL2_SS2(1);
    P_Thermal = Thermaloutput_SSL2_SS2(2);
    Cost_radiator = Thermaloutput_SSL2_SS2(3);
    Cost_heater = Thermaloutput_SSL2_SS2(4);


Thermal_SSL2_io = [M_thermalfinish Cost_thermalfinish M_radiator P_Thermal Cost_radiator Cost_heater];
end