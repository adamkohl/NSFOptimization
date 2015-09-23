%% Thermal SSL2 SS2 (Radiator and Heater)
function Thermaloutput_SSL2_SS2 = thermal_SSL2_SS2(eps_rad_battery,eps_rad_RW,eps_rad_tank,Controller)


    T_battery = 15;
    T_sensors = 30;
    T_antenna = 100;
    T_SA = 110;
    T_bus = 50;
    T_tank = 40;
   
    
    T_battery_min = 0;
    T_sensors_min = 0;
    T_antenna_min = -100;
    T_SA_min = -150;
    T_tank_min = 15;
    sigma = 5.67051*10^-8;
    S = 1367;
    
    if Controller == 1
    T_RW = 50;
    T_RW_min = -10;
    elseif Controller == 2
        T_RW = 40;
        T_RW_min = 15;
    end

            
% Radiator and heater
Qint = 400;

    % Radiator and heater for batteries
    if eps_rad_battery == 1 % 5 mil Aluminized Teflon
        eps_batt = 0.78;
       A_radiator_battery = Qint/(sigma*eps_batt*(T_battery+273)^4);
       P_heater_battery = eps_batt*sigma*A_radiator_battery*(T_battery_min+273)^4;
%        Cost_radiator_battery = 100*A_radiator_battery;
       Cost_radiator_battery = 0.27*A_radiator_battery*10;
       Cost_heater_battery = 20*P_heater_battery;
       
    elseif eps_rad_battery == 2 % White paint (Z93)
        eps_batt = 0.92;
        A_radiator_battery = Qint/(sigma*eps_batt*(T_battery+273)^4);
        P_heater_battery = eps_batt*sigma*A_radiator_battery*(T_battery_min+273)^4;
        Cost_radiator_battery = 200*A_radiator_battery;
        Cost_heater_battery = 20*P_heater_battery;
    end
    
    % Radiator and heater for RW
    if eps_rad_RW == 1 % 5 mil Aluminized Teflon
        eps_RW = 0.78;
       A_radiator_RW = Qint/(sigma*eps_RW*(T_RW+273)^4);
       P_heater_RW = eps_RW*sigma*A_radiator_RW*(T_RW_min+273)^4;
%        Cost_radiator_RW = 100*A_radiator_RW;
       Cost_radiator_RW = 0.27*A_radiator_RW*10;
       Cost_heater_RW = 20*P_heater_RW;
    elseif eps_rad_RW == 2 % White paint (Z93)
        eps_RW = 0.92;
        A_radiator_RW = Qint/(sigma*eps_RW*(T_RW+273)^4);
        P_heater_RW = eps_RW*sigma*A_radiator_RW*(T_RW_min+273)^4;
        Cost_radiator_RW = 200*A_radiator_RW;
        Cost_heater_RW = 20*P_heater_RW;
    end
    
    % Radiator and heater for Propellant tank
    if eps_rad_tank == 1 % 5 mil Aluminized Teflon
        eps_tank = 0.78;
       A_radiator_tank = Qint/(sigma*eps_tank*(T_tank+273)^4);
       P_heater_tank = eps_tank*sigma*A_radiator_tank*(T_tank_min+273)^4;
%        Cost_radiator_tank = 100*A_radiator_tank;
       Cost_radiator_tank = 0.27*A_radiator_tank*10;
       Cost_heater_tank = 20*P_heater_tank;
    elseif eps_rad_tank == 2 % White paint (Z93)
        eps_tank = 0.92;
        A_radiator_tank = Qint/(sigma*eps_tank*(T_tank+273)^4);
        P_heater_tank = eps_tank*sigma*A_radiator_tank*(T_tank_min+273)^4;
        Cost_radiator_tank = 200*A_radiator_tank;
        Cost_heater_tank = 20*P_heater_tank;
    end
    
M_radiator = 3.3*(A_radiator_battery+A_radiator_RW+A_radiator_tank); 
P_thermal = P_heater_battery + P_heater_RW + P_heater_tank;
Cost_radiator = Cost_radiator_battery + Cost_radiator_RW + Cost_radiator_tank;    
Cost_heater = Cost_heater_battery + Cost_heater_RW + Cost_heater_tank;

Thermaloutput_SSL2_SS2 = [M_radiator P_thermal Cost_radiator Cost_heater];
end