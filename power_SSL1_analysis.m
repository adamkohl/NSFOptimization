function Power_SSL1_io = power_SSL1_analysis(P_payload,P_ADCS,P_Thermal,Power,SA_material,Batt)

Poweroutput_SSL1 = power_SSL1(P_payload,P_ADCS,P_Thermal,Power,SA_material,Batt);
    Cost_power = Poweroutput_SSL1(1);
    Array_size = Poweroutput_SSL1(2);
    M_SA = Poweroutput_SSL1(3);
    Cost_SA = Poweroutput_SSL1(4);
    Cost_Batt = Poweroutput_SSL1(5);
    Battery_mass = Poweroutput_SSL1(6);
    V_batt = Poweroutput_SSL1(7);
    Battery_capacity = Poweroutput_SSL1(8);
    
Power_SSL1_io = [Cost_power Array_size M_SA Cost_SA Cost_Batt Battery_mass V_batt Battery_capacity];
end