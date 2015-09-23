function Power_SSL2_io = power_SSL2_analysis(SA_material,Batt,Po)

Poweroutput_SSL2_SS1 = power_SSL2_SS1(SA_material,Po);
    Array_size = Poweroutput_SSL2_SS1(1);
    M_SA = Poweroutput_SSL2_SS1(2);
    Cost_SA = Poweroutput_SSL2_SS1(3);
Poweroutput_SSL2_SS2 = power_SSL2_SS2(Batt,Po);
    Cost_Batt = Poweroutput_SSL2_SS2(1);
    Battery_mass = Poweroutput_SSL2_SS2(2);
    V_batt = Poweroutput_SSL2_SS2(3);
    Battery_capacity = Poweroutput_SSL2_SS2(4);


Power_SSL2_io = [Array_size M_SA Cost_SA Cost_Batt Battery_mass V_batt Battery_capacity];
end

