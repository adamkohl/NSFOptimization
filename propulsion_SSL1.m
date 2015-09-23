%% Propulsion SSL1(Engine)
function Propulsionoutput_SSL1 = propulsion_SSL1(Prop,Prop_tech,Prop_tank_material,...
    M_payload,M_SA,Battery_mass,M_ADCS,M_thermal,M_bus)

M_B = M_payload + M_SA + Battery_mass + M_ADCS + M_thermal + M_bus;



if Prop_tech == 1
    Cost_Engine_per_kg = 1000;
elseif Prop_tech == 2
    Cost_Engine_per_kg = 2000;
end

Propulsionoutput_SSL2_SS1 = propulsion_SSL2_SS1(Prop,Prop_tech,...
    Cost_Engine_per_kg,M_B,Prop_tank_material);
       M_propulsion = Propulsionoutput_SSL2_SS1(1);
       V_propellant = Propulsionoutput_SSL2_SS1(2);
       Cost_Engine = Propulsionoutput_SSL2_SS1(3);
       Cost_propellant = Propulsionoutput_SSL2_SS1(4);
       M_propellant = Propulsionoutput_SSL2_SS1(5);
       Cost_prop_tank = Propulsionoutput_SSL2_SS1(6);
       M_propellanttank = Propulsionoutput_SSL2_SS1(7);
       V_propellanttank = Propulsionoutput_SSL2_SS1(8);

Cost_propulsion = Cost_Engine + Cost_propellant + Cost_prop_tank;

Propulsionoutput_SSL1 = [Cost_propulsion Cost_Engine_per_kg M_propulsion V_propellant Cost_Engine Cost_propellant M_propellant ...
                        Cost_prop_tank M_propellanttank V_propellanttank];
end