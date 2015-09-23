%% Propulsion SSL2 SS1 (Propellant)
function Propulsionoutput_SSL2_SS1 = propulsion_SSL2_SS1(Prop,Prop_tech,...
    Cost_Engine_per_kg,M_B,Prop_tank_material)




deltaV_total = 1500;
% % Burnout Mass 
%     M_B = M_payload + M_SA + Battery_mass + M_ADCS + M_thermal + M_bus;
    
% acceleration due to gravity in m/s^2  
    ge = 9.81;

if Prop_tech == 1 % Mono-propellant
    if Prop == 1 % Hydrazine
    ro_propellant = 1021;
    Isp = 220;
    R = exp(deltaV_total/(Isp*ge));
    M_propellant = (R*M_B - M_B);
    Engine_mass = 10;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*7*M_propellant/0.453;
    
    elseif Prop == 2 % Hydrogen peroxide
    ro_propellant = 1440;
    Isp = 160;
    R = exp(deltaV_total/(Isp*ge));
    M_propellant = (R*M_B - M_B);
    Engine_mass = 20;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 4.50*M_propellant/0.453;

   
    elseif Prop == 3 % Hydrazine
    ro_propellant = 1021;
    Isp = 230;
    R = exp(deltaV_total/(Isp*ge));
    M_propellant = (R*M_B - M_B);
    Engine_mass = 10;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*7*M_propellant/0.453;
     
    elseif Prop == 4 % Hydrogen peroxide
    ro_propellant = 1440;
    Isp = 160;
    R = exp(deltaV_total/(Isp*ge));
    M_propellant = (R*M_B - M_B);
    Engine_mass = 20;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 4.50*M_propellant/0.453;

    end
    M_oxidizer = 0;
    V_oxidizertank = 0;
    M_oxidizertank = 0;
    Margin_propellant = 1.1;
    V_propellant = M_propellant * Margin_propellant/(ro_propellant);  
end


if Prop_tech == 2 % Liquid Propellant
    if Prop == 1 % LO & LH 
    ro_propellant = 358;
    Isp = 455.3;
    R = exp(deltaV_total/(Isp*ge));
    Margin_propellant = 1.1;
    M_propellant = (R*M_B - M_B);
    V_propellant = M_propellant * Margin_propellant/(ro_propellant);
    Engine_mass = 168;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*4.5*M_propellant/0.453;
    
    elseif Prop == 2 % N2O4 & MMH
    ro_propellant = 1190;
    Isp = 341.5;
    R = exp(deltaV_total/(Isp*ge));
    Margin_propellant = 1.1;
    M_propellant = (R*M_B - M_B);
    V_propellant = M_propellant * Margin_propellant/(ro_propellant);
    Engine_mass = 25;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*6.60*M_propellant/0.453;

    elseif Prop == 3 % F2 & N2H4
    ro_propellant = 1310;
    Isp = 430.1;
    R = exp(deltaV_total/(Isp*ge));
    Margin_propellant = 1.1;
    M_propellant = (R*M_B - M_B);
    V_propellant = M_propellant * Margin_propellant/(ro_propellant);
    Engine_mass = 50;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*20*M_propellant/0.453;
    
    elseif Prop == 4 % OF2 & B2H6
    ro_propellant = 1010;
    Isp = 445.6;
    R = exp(deltaV_total/(Isp*ge));
    Margin_propellant = 1.1;
    M_propellant = (R*M_B - M_B);
    V_propellant = M_propellant * Margin_propellant/(ro_propellant);
    Engine_mass = 150;
    Cost_Engine = Cost_Engine_per_kg*Engine_mass;
    Cost_propellant = 2.48*100*M_propellant/0.453;
    end 

end


Propulsionoutput_SSL3_SS1 = propulsion_SSL3_SS1(Prop_tank_material,V_propellant);
    Cost_prop_tank = Propulsionoutput_SSL3_SS1(1);
    M_propellanttank = Propulsionoutput_SSL3_SS1(2);
    V_propellanttank = Propulsionoutput_SSL3_SS1(3);

M_propulsion = M_propellant + M_propellanttank + Engine_mass;
Propulsionoutput_SSL2_SS1 = [M_propulsion V_propellant Cost_Engine Cost_propellant M_propellant...
                            Cost_prop_tank M_propellanttank V_propellanttank];
end
