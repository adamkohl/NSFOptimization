function Power_io = poweranalysis(SA_material,Batt,P_payload,P_ADCS,P_Thermal,Power)

Cost_SA_new = 100;
Cost_Batt_new = 100;

Cost_SA_old = 0;
Cost_Batt_old = 0;

i = 0;
while (abs(Cost_SA_old-Cost_SA_new)>10^-6||...
        abs(Cost_Batt_old-Cost_Batt_new)>10^-6)
i = i+1;
    Cost_SA_old = Cost_SA_new;
    Cost_Batt_old = Cost_Batt_new;

Power_SSL1_io = power_SSL1_analysis(Cost_SA_new,Cost_Batt_new,P_payload,P_ADCS,P_Thermal,Power);
    Cost_power = Power_SSL1_io(1);
    Po = Power_SSL1_io(2);
Power_SSL2_io = power_SSL2_analysis(SA_material,Batt,Po);
    Array_size = Power_SSL2_io(1);
    M_SA = Power_SSL2_io(2);
    Cost_SA_new = Power_SSL2_io(3);
    Cost_Batt_new = Power_SSL2_io(4);
    Battery_mass = Power_SSL2_io(5);
    V_batt = Power_SSL2_io(6);
    Battery_capacity = Power_SSL2_io(7);
end



Power_io = [Cost_power Array_size M_SA Cost_SA_new Cost_Batt_new Battery_mass V_batt Battery_capacity];
end