%% Launch vehicle SSL1
function Launchvehicleoutput_SSL1 = launchvehicle_SSL1(launchsite,Launch_vehicle,M_propulsion,M_thermal,...
    M_SA,Battery_mass,M_bus,M_ADCS,M_payload)
Spacecraft_mass = M_propulsion+M_thermal+M_SA+Battery_mass+M_bus+M_ADCS+M_payload;

Vi = 3.08*10^3;

if launchsite == 1 % Cape Canaveral
    theta = 28;
    deltaV_planechange = 2*Vi*sind(theta/2);
elseif launchsite == 2 % % Vandenberg Airforce Base
    theta = 34;
    deltaV_planechange = 2*Vi*sind(theta/2);
elseif launchsite == 3 % % Wallops, VA
    theta = 37;
    deltaV_planechange = 2*Vi*sind(theta/2);
end

deltaV_LEO = 10000;
deltaV_GTO = 2.46*10^3;
deltaV_LV = deltaV_LEO + deltaV_GTO + deltaV_planechange;

% Burnout Mass 
    M_B_lv = M_payload + M_SA + Battery_mass + M_ADCS + M_thermal + M_bus + M_propulsion;
    
% acceleration due to gravity in m/s^2  
    ge = 9.81;

if Launch_vehicle == 1 % Atlas V
    Isp_1 = 311;
    Isp_2 = 450;
    
    
    R_1 = exp(deltaV_LEO/(Isp_1*ge));
    M_propellant_1 = R_1*M_B_lv - M_B_lv;
    M_propellant_1 = M_propellant_1*1.2;
    
    R_2 = exp((deltaV_GTO+deltaV_planechange)/(Isp_2*ge));
    M_propellant_2 = R_2*M_B_lv - M_B_lv;
    M_propellant_2 = M_propellant_2*1.2;
    
%     R_3 = exp(deltaV_planechange/(Isp_3*ge));
%     M_propellant_3 = R_3*M_B_lv - M_B_lv;
%     M_propellant_3 = M_propellant_3*1.2;
    
    M_propellant_lv = M_propellant_1 + M_propellant_2;
    
elseif Launch_vehicle == 2 % Delta II
    Isp_1 = 302; 
    Isp_2 = 319;
    Isp_3 = 286;
    
    R_1 = exp(deltaV_LEO/(Isp_1*ge));
    M_propellant_1 = R_1*M_B_lv - M_B_lv;
    M_propellant_1 = M_propellant_1*1.2;
    
    R_2 = exp(deltaV_GTO/(Isp_2*ge));
    M_propellant_2 = R_2*M_B_lv - M_B_lv;
    M_propellant_2 = M_propellant_2*1.2;
    
    R_3 = exp(deltaV_planechange/(Isp_3*ge));
    M_propellant_3 = R_3*M_B_lv - M_B_lv;
    M_propellant_3 = M_propellant_3*1.2;
    
    M_propellant_lv = M_propellant_1 + M_propellant_2 + M_propellant_3;
    
elseif Launch_vehicle == 3 % Falcon 9
    Isp_1 = 311;
    Isp_2 = 342;
     
    
    R_1 = exp(deltaV_LEO/(Isp_1*ge));
    M_propellant_1 = R_1*M_B_lv - M_B_lv;
    M_propellant_1 = M_propellant_1*1.2;
    
    R_2 = exp((deltaV_GTO+deltaV_planechange)/(Isp_2*ge));
    M_propellant_2 = R_2*M_B_lv - M_B_lv;
    M_propellant_2 = M_propellant_2*1.2;
%     
%     R_3 = exp(deltaV_planechange/(Isp_3*ge));
%     M_propellant_3 = R_3*M_B_lv - M_B_lv;
%     M_propellant_3 = M_propellant_3*1.2;
    
    M_propellant_lv = M_propellant_1 + M_propellant_2;
    
elseif Launch_vehicle == 4 % Titan IV
    Isp_1 = 302;
    Isp_2 = 316;
    Isp_3 = 444;
    
    R_1 = exp(deltaV_LEO/(Isp_1*ge));
    M_propellant_1 = R_1*M_B_lv - M_B_lv;
    M_propellant_1 = M_propellant_1*1.2;
    
    R_2 = exp(deltaV_GTO/(Isp_2*ge));
    M_propellant_2 = R_2*M_B_lv - M_B_lv;
    M_propellant_2 = M_propellant_2*1.2;
    
    R_3 = exp(deltaV_planechange/(Isp_3*ge));
    M_propellant_3 = R_3*M_B_lv - M_B_lv;
    M_propellant_3 = M_propellant_3*1.2;
    
    M_propellant_lv = M_propellant_1 + M_propellant_2 + M_propellant_3;
    
end

if launchsite == 1 % Cape Canveral
    if Launch_vehicle == 1 % Atlas V
        Cost_lv = 15000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 2 % Delta II
        Cost_lv = 13000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 3 % Falcon 9
        Cost_lv = 12800*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 4 % Titan IV
        Cost_lv = 14000*Spacecraft_mass + 100*M_propellant_lv;
    end
elseif launchsite == 2 % Vandenberg Airforce Base
    if Launch_vehicle == 1 % Atlas V
        Cost_lv = 12000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 2 % Delta II
        Cost_lv = 11000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 3 % Falcon 9
        Cost_lv = 10500*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 4 % Titan IV
        Cost_lv = 11500*Spacecraft_mass + 100*M_propellant_lv;
    end
elseif launchsite == 3 % Wallops, VA
    if Launch_vehicle == 1 % Atlas V
        Cost_lv = 11000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 2 % Delta II
        Cost_lv = 10500*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 3 % Falcon 9
        Cost_lv = 10000*Spacecraft_mass + 100*M_propellant_lv;
    elseif Launch_vehicle == 4 % Titan IV
        Cost_lv = 10750*Spacecraft_mass + 100*M_propellant_lv;
    end
end

M_propellant_lv;
Launchvehicleoutput_SSL1 = [Cost_lv];
end