%% Power system SSL1
function Poweroutput_SSL1 = power_SSL1(P_payload,P_ADCS,P_Thermal,Power,SA_material,Batt)



    Po = P_payload + P_ADCS + P_Thermal;
    
    
Power_SSL2_io = power_SSL2_analysis(SA_material,Batt,Po);
    Array_size = Power_SSL2_io(1);
    M_SA = Power_SSL2_io(2);
    Cost_SA = Power_SSL2_io(3);
    Cost_Batt = Power_SSL2_io(4);
    Battery_mass = Power_SSL2_io(5);
    V_batt = Power_SSL2_io(6);
    Battery_capacity = Power_SSL2_io(7);
    

if Power == 1 % Solar Array & Battery
    Cost_power = Cost_SA + Cost_Batt;
    M_SA = Power_SSL2_io(2);
    Battery_mass = Power_SSL2_io(5);
elseif Power == 2 % Nuclear
    Cost_power = 50*10^6;
    M_SA = 500;
    Battery_mass = 500;
end

Poweroutput_SSL1 = [Cost_power Array_size M_SA Cost_SA Cost_Batt Battery_mass V_batt Battery_capacity];

end