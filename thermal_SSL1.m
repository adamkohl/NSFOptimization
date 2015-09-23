%% Thermal SSL1 
function Thermaloutput_SSL1 = thermal_SSL1(Thermal,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config)

Thermal_SSL2_io = thermal_SSL2_analysis(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,eps_rad_battery,eps_rad_RW,eps_rad_tank,...
    Array_size,Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config);
    M_thermalfinish = Thermal_SSL2_io(1);
    Cost_thermalfinish = Thermal_SSL2_io(2);
    M_radiator = Thermal_SSL2_io(3);
    P_Thermal = Thermal_SSL2_io(4);
    Cost_radiator = Thermal_SSL2_io(5);
    Cost_heater = Thermal_SSL2_io(6);




if Thermal == 1 % Thermal finish 
    Cost_thermal = Cost_thermalfinish + Cost_radiator + Cost_heater;
    M_thermalfinish = Thermal_SSL2_io(1);
elseif Thermal == 2 % Heat pipe
    Cost_heatpipe = 5*10^6;
    M_heatpipe = 1000;
    M_thermalfinish = M_heatpipe;
    Cost_thermal = Cost_heatpipe + Cost_radiator + Cost_heater;
end

M_thermal = M_radiator + M_thermalfinish;

Thermaloutput_SSL1 = [Cost_thermal M_thermal M_thermalfinish Cost_thermalfinish M_radiator P_Thermal Cost_radiator Cost_heater];
end