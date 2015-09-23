%% Structures SSL1 (Bus configuration)
function Structuresout_SSL1 = structures_SSL1(bus_config,Launch_vehicle,M_ADCS,M_thermal,M_payload,M_propulsion,...
    M_SA,Battery_mass,V_trans,V_propellant,V_RW,V_batt,bus_material)
% Load factors 
    LF_a = 6;
    LF_l = 3;
    LF_BM = 3;
    
    Structuresout_SSL2_SS1 = structures_SSL2_SS1(bus_material);
        ro_bus = Structuresout_SSL2_SS1(1);
        E = Structuresout_SSL2_SS1(2);
        F_tu = Structuresout_SSL2_SS1(3);
        F_ty = Structuresout_SSL2_SS1(4);
        FOS_ulti = Structuresout_SSL2_SS1(5);
        FOS_yield = Structuresout_SSL2_SS1(6);
        Cost_bus_per_kg = Structuresout_SSL2_SS1(7);
    
if bus_config == 1 % cylindrical bus 
    V_bus_1 =1.2*(1.2*V_propellant+V_RW+V_batt+V_trans);
    L_structures = (9*V_bus_1/pi)^(1/3);
    r_structures = L_structures/3;

    % Sizing for rigidity to meet the natural frequency requirement

    if Launch_vehicle == 1 % Atlas V
        fnat_a = 15;
        fnat_l = 10;
    elseif Launch_vehicle == 2 % Delta II
        fnat_a = 35;
        fnat_l = 15;
    elseif Launch_vehicle == 3 % Falcon 9 
        fnat_a = 25;
        fnat_l = 15;
    elseif Launch_vehicle == 4 % Titan IV
        fnat_a = 24;
        fnat_l = 10;
    end

    M_SC = M_ADCS+M_thermal+M_propulsion+Battery_mass+M_SA+M_payload;


    t1 = ((fnat_a/0.25)^2)*M_SC*L_structures/(2*pi*r_structures*E);
    t2 = ((fnat_l/0.56)^2)*M_SC*L_structures^3/(pi*r_structures^3*E);



    %% Sizing for tensile strength

    M_SC = M_ADCS+M_thermal+M_propulsion+Battery_mass+M_SA+M_payload;

    Paxial = M_SC*LF_a*9.81;

    Plateral = M_SC*LF_l*9.81;
    
    BM = Plateral*L_structures/2;

    Peq = Paxial + 2*BM/r_structures;
    
    F_ulti = Peq*FOS_ulti;
    
    t_req1 = F_ulti/(F_tu*2*pi*r_structures);
    t_req2 = Peq*FOS_yield/(2*pi*r_structures*F_ty);

    tt = [t_req1 t_req2 t1 t2];
    t = max(tt);

    % Sizing for stability (Compressive strength)

    phi = (1/16)*sqrt(r_structures/t);
    
    gamma = 1-0.901*(1-exp(-phi));
   
    sigma_cr = 0.6*gamma*E*t/r_structures;
     
    A = 2*pi*r_structures*t;
    P_cr = A*sigma_cr;
    
    MS = P_cr/F_ulti - 1;


    while (MS <=0)
        
    t=t+(10^-3);
        
    phi = (1/16)*sqrt(r_structures/t);
    gamma = 1-0.901*(1-exp(-phi));
    sigma_cr = 0.6*gamma*E*t/r_structures;
    A = 2*pi*r_structures*t;
    P_cr = A*sigma_cr;
%     Pcr = r*pi^3*E*ws^3*t/(hs^2);
    MS = P_cr/F_ulti - 1; 
    end
    
    M_bus = ro_bus*pi*L_structures*(r_structures^2-(r_structures-t)^2);
 

    t_structures = t;
    V_bus = pi*L_structures*(r_structures^2-(r_structures-t_structures)^2);

    Ix_structures = (1/12)*M_bus*(3*r_structures^2 + (r_structures-t_structures)^2 + L_structures^2); 
    Iy_structures = (1/12)*M_bus*(3*r_structures^2 + (r_structures-t_structures)^2 + L_structures^2); 
    Iz_structures = (1/2)*M_bus*(r_structures^2 + (r_structures-t_structures)^2); 
    hs = 0;
    ws = 0;    
    
    elseif bus_config == 2 % rectangular bus
    
    V_bus_1 =1.2*(1.2*V_propellant+V_RW+V_batt+V_trans);
    hs = (3*V_bus_1)^(1/3);
    ws = hs/3;
    ds = ws;

    % Sizing for rigidity to meet the natural frequency requirement

    if Launch_vehicle == 1 % Atlas V
        fnat_a = 15;
        fnat_l = 10;
    elseif Launch_vehicle == 2 % Delta II
        fnat_a = 35;
        fnat_l = 15;
    elseif Launch_vehicle == 3 % Falcon 9 
        fnat_a = 25;
        fnat_l = 15;
    elseif Launch_vehicle == 4 % Titan IV
        fnat_a = 24;
        fnat_l = 10;
    end
    M_SC = M_ADCS+M_thermal+M_propulsion+Battery_mass+M_SA+M_payload;

    t1 = ((fnat_a/0.25)^2)*M_SC*hs/(4*ws*E);
    t2 = ((fnat_l/0.56)^2)*M_SC*hs^3/(pi*ws^3*E);
%      t2 = (ws^4-12*(fnat_l/0.56)^2*M_SC*hs^3)/(8*ws^3);

    % Sizing for tensile strength

    Paxial = M_SC*LF_a*9.81;

    Plateral = M_SC*LF_l*9.81;
    
    BM = Plateral*hs/2;

    Peq = Paxial + 2*BM/ws;
    
    F_ulti = Peq*FOS_ulti;
    
    t_req1 = F_ulti/(F_tu*4*ws);
    t_req2 = Peq*FOS_yield/(4*ws*F_ty);
    tt = [t_req1 t_req2 t1 t2];
    t = max(tt);
    

    % Sizing for stability (Compressive strength)
    II = (ws^4)/12 - ((ws-2*t)^4)/12;
%     P_cr = 4*pi^3*E*ws^3*t/(hs^2)
    P_cr = pi^2*E*II/(2*hs)^2;
    MS = P_cr/F_ulti - 1;
    
    while (MS <=0)
        
    t=t+(10^-3);
    P_cr = 4*pi^3*E*ws^3*t/(hs^2);
    MS = P_cr/F_ulti - 1;

    end
% P_cr
% MS
    Mo = ro_bus*ws*ds*hs;
    wss = ws-2*t;
    dss = ds-2*t;
    Mi = ro_bus*wss*dss*hs;
    M_bus = ro_bus*hs*(ws*ds-(ws-2*t)*(ds-2*t));
    V_bus = M_bus/ro_bus;

    Ix_structures = (1/12)*(Mo*(hs^2+ws^2) - Mi*(hs^2+wss^2));
    Iy_structures = (1/12)*(Mo*(hs^2+ds^2) - Mi*(hs^2+dss^2));
    Iz_structures = (1/12)*(Mo*(ds^2+ws^2) - Mi*(dss^2+wss^2));
    t_structures = t;
    L_structures = 0;
    r_structures = 0;
end
% hs
% ws
%    t
% MS

Cost_structures = Cost_bus_per_kg*M_bus;

   Structuresout_SSL1 = [Cost_structures M_bus L_structures r_structures t_structures hs ws V_bus Ix_structures Iy_structures Iz_structures...
                        ro_bus E F_tu F_ty FOS_ulti FOS_yield Cost_bus_per_kg]; 
end    