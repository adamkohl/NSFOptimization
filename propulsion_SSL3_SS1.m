%% Propulsion SSL3 SS1 (Propellant tank)
function Propulsionoutput_SSL3_SS1 = propulsion_SSL3_SS1(Prop_tank_material,V_propellant)

if Prop_tank_material == 1 % Aluminum 
    ro_propellanttank = 2700;
elseif Prop_tank_material == 2 % Steel
    ro_propellanttank = 7860;
elseif Prop_tank_material == 3 % Composite
    ro_propellanttank = 2000;
end

% Mass & Volume of Propellant tank
        dp = (6*V_propellant/pi)^(1/3);
        V_propellanttank = (pi/6)*((dp+0.01)^3-(dp^3));
        M_propellanttank = V_propellanttank*ro_propellanttank;
%         V_propellanttank = 1.2*V_propellant;

% Cost of Propellant tank
if Prop_tank_material == 1 % Aluminum
    Cost_prop_tank = 100*M_propellanttank;
elseif Prop_tank_material == 2 % Steel
    Cost_prop_tank = 10*M_propellanttank;
elseif Prop_tank_material == 3 % Composite
    Cost_prop_tank = 5000*M_propellanttank; 
end

Propulsionoutput_SSL3_SS1 = [Cost_prop_tank M_propellanttank V_propellanttank];
end