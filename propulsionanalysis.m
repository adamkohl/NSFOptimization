function propulsion_io = propulsionanalysis(Prop,Prop_tech,Prop_tank_material,M_payload,M_SA,Battery_mass,M_ADCS,M_thermal,M_bus)


Cost_Engine_new = 100;
Cost_propellant_new = 100;
Cost_prop_tank_new = 100;
M_propellanttank_new = 100;

Cost_Engine_old = 0;
Cost_propellant_old = 0;
Cost_prop_tank_old = 0;
M_propellanttank_old = 0;

i = 0;
while (abs(Cost_Engine_old-Cost_Engine_new)>10^-6||...
        abs(Cost_propellant_old-Cost_propellant_new)>10^-6||...
        abs(Cost_prop_tank_old-Cost_prop_tank_new)>10^-6||...
        abs(M_propellanttank_old-M_propellanttank_new)>10^-6)
    i = i+1;
    
    Cost_Engine_old = Cost_Engine_new;
    Cost_propellant_old = Cost_propellant_new;
    Cost_prop_tank_old = Cost_prop_tank_new;
    M_propellanttank_old = M_propellanttank_new;

Propulsionoutput_SSL1 = propulsion_SSL1(Prop_tech,Cost_Engine_new,Cost_propellant_new,Cost_prop_tank_new,...
                                        M_payload,M_SA,Battery_mass,M_ADCS,M_thermal,M_bus);
    Cost_propulsion = Propulsionoutput_SSL1(1);
    Cost_Engine_per_kg = Propulsionoutput_SSL1(2);
    M_B = Propulsionoutput_SSL1(3);
Propulsionoutput_SSL2_SS1 = propulsion_SSL2_SS1(Prop,Prop_tech,Cost_Engine_per_kg,M_propellanttank_new,M_B);
    M_propulsion = Propulsionoutput_SSL2_SS1(1);
    V_propellant = Propulsionoutput_SSL2_SS1(2);
    Cost_Engine_new = Propulsionoutput_SSL2_SS1(3);
    Cost_propellant_new = Propulsionoutput_SSL2_SS1(4);
    M_propellant = Propulsionoutput_SSL2_SS1(5);
Propulsionoutput_SSL3_SS1 = propulsion_SSL3_SS1(Prop_tank_material,V_propellant);
    Cost_prop_tank_new = Propulsionoutput_SSL3_SS1(1);
    M_propellanttank_new = Propulsionoutput_SSL3_SS1(2);
    V_propellanttank = Propulsionoutput_SSL3_SS1(3);  
end


propulsion_io = [Cost_propulsion Cost_Engine_per_kg M_propulsion V_propellant Cost_Engine_new Cost_propellant_new M_propellant Cost_prop_tank_new M_propellanttank_new V_propellanttank];
end
