%% Power system SSL2 SS2 (Power storage - Battery)
function Poweroutput_SSL2_SS2 = power_SSL2_SS2(Batt,Po)

%% Battery sizing
%        Po = P_payload + P_ADCS + P_Thermal;
       %  TE - Maximum eclpise time in hrs
      
        To = 24;
        TE = 1.2;
        TS = To - TE;
        H_batt = 0.94;
        if Batt == 1 % Ni-Cd
            DOD = 0.50;
            Energy_density = 40; % Wh/Kg
            ro_batt = 1250;
            Battery_capacity = Po*TE/(DOD*H_batt);
            Battery_mass = Battery_capacity/Energy_density;
            V_batt = Battery_mass/ro_batt;
            Cost_Batt = 1000*Energy_density*Battery_mass;
        elseif Batt == 2 % Ni-H2
            DOD = 0.7;
            Energy_density = 60;
            ro_batt = 3500;
            Battery_capacity = Po*TE/(DOD*H_batt);
            Battery_mass = Battery_capacity/Energy_density;
            V_batt = Battery_mass/ro_batt;
            Cost_Batt = 1500*Energy_density*Battery_mass;
        elseif Batt == 3 % Li-ion
            DOD = 0.25;
            Energy_density = 130;
            ro_batt = 2307.6;
            Battery_capacity = Po*TE/(DOD*H_batt);
            Battery_mass = Battery_capacity/Energy_density;
            V_batt = Battery_mass/ro_batt;
            Cost_Batt = 1200*Energy_density*Battery_mass;
        end
   Poweroutput_SSL2_SS2 = [Cost_Batt Battery_mass V_batt Battery_capacity];    
end