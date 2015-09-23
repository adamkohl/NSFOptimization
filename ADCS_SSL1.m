%% ADCS SSL1
function ADCSoutput_SSL1 = ADCS_SSL1(Controller,M_payload_t,M_payload_r,L_structures,r_structures,...
    hs,ws,Dsat_trans,Dsat_rec,Array_size,Ix_structures,Iy_structures,Iz_structures,bus_config,h,M_SA)

 % MI of Solar array
    b_SA = sqrt(Array_size/6);
    l_SA = 3*b_SA;
    t_SA = 10^-3;
    Ix_SA = (1/12)*(M_SA/2)*(t_SA^2+(l_SA/2)^2);
        
    Iy_SA = (1/12)*(M_SA/2)*(b_SA^2+t_SA^2);
    
    Iz_SA = (1/12)*(M_SA/2)*(b_SA^2+(l_SA/2)^2) + (r_structures+l_SA/4)^2*(M_SA/2);
     
    
   % MI of payload
    % Transmitting antenna
   t_payload = 3*10^-2;
   
   
   if bus_config == 1 % cylindrical
   Ix_ant_trans = (1/12)*M_payload_t*(3*(Dsat_trans)^2 + t_payload^2) + M_payload_t*(t_payload/2 + L_structures/2)^2;
   
   Iy_ant_trans = Ix_ant_trans;
   
   Iz_ant_trans = (M_payload_t/2)*(Dsat_trans/2)^2;
   
    % Receiving antenna
    Ix_ant_rec = (M_payload_r/2)*(Dsat_rec/2)^2 + M_payload_r*(t_payload/2 + L_structures/2)^2;
    Iy_ant_rec = Ix_ant_rec;
    Iz_ant_rec = (1/12)*M_payload_r*(3*(Dsat_rec/2)^2 + t_payload^2);

Ix = Ix_structures + 2*Ix_SA + Ix_ant_trans + Ix_ant_rec;
Iy = Iy_structures + 2*Iy_SA + Iy_ant_trans + Iy_ant_rec;
Iz = Iz_structures + 2*Iz_SA + Iz_ant_trans + Iz_ant_rec;


% Disturbance Torques

    % Gravity-gradient torque
        
        mu = 3.986*10^14;  % in m^3/s^2
        R  = (h+6374.4*10^3);   % orbital radius in m
        theta = 1;
        Tg = (3*mu*abs(Iz-Iy)*sind(2*theta))/(2*R^3);
        
    % Torque due to Solar radiation
        Fs = 1367;
        c = 2.998*10^8;
        As = L_structures*2*r_structures + 2*l_SA*b_SA + t_payload*Dsat_trans + t_payload*Dsat_rec;
        alpha = 23.5;
        q = 0.6;
        F = (Fs/c)*As*(1+q)*cosd(alpha);
        Tsp = F*(.3);
        
   elseif bus_config == 2 % rectangular
       Ix_ant_trans = (1/12)*M_payload_t*(3*(Dsat_trans)^2 + t_payload^2) + M_payload_t*(t_payload/2 + hs/2)^2;
   
   Iy_ant_trans = Ix_ant_trans;
   
   Iz_ant_trans = (M_payload_t/2)*(Dsat_trans/2)^2;
   
    % Receiving antenna
    Ix_ant_rec = (M_payload_r/2)*(Dsat_rec/2)^2 + M_payload_r*(t_payload/2 + hs/2)^2;
    Iy_ant_rec = Ix_ant_rec;
    Iz_ant_rec = (1/12)*M_payload_r*(3*(Dsat_rec/2)^2 + t_payload^2);

Ix = Ix_structures + 2*Ix_SA + Ix_ant_trans + Ix_ant_rec;
Iy = Iy_structures + 2*Iy_SA + Iy_ant_trans + Iy_ant_rec;
Iz = Iz_structures + 2*Iz_SA + Iz_ant_trans + Iz_ant_rec;


% Disturbance Torques

    % Gravity-gradient torque
        
        mu = 3.986*10^14;  % in m^3/s^2
        R  = (h+6374.4*10^3);   % orbital radius in m
        theta = 1;
        Tg = (3*mu*abs(Iz-Iy)*sind(2*theta))/(2*R^3);
        
    % Torque due to Solar radiation
        Fs = 1367;
        c = 2.998*10^8;
        As = hs*ws + 2*l_SA*b_SA + t_payload*Dsat_trans + t_payload*Dsat_rec;
        alpha = 23.5;
        q = 0.6;
        F = (Fs/c)*As*(1+q)*cosd(alpha);
        Tsp = F*(.3);
   end
       
        
% Total disturbance torque
    Td = Tg + Tsp;
    
    
    if Controller == 1 % Reaction Wheel
        
% Angular momentum required by the reaction wheels
    T_RW = Td * 1.3;
    
    % Angular momentum needed to counter disturbance torques
    hd = T_RW*(24*60*60/4)*0.707;
    
    % Angular momentum needed for pointing accuracy
    theta_d = 0.1*pi/180;
    hp = T_RW*24*60*60/(4*theta_d);
    
    
% Total angular momentum needed by the RW
    Angular_momentum_RW = hd + hp;
    
% Sizing of ADCS
    % Mass of RWs
        M_RW = (Angular_momentum_RW + 44)/22.2;
    
    % Mass of sensors
        M_sensors = 3;
    
    % Total mass
        M_ADCS = M_RW + M_sensors;
        
    
    % Power needed by RW motor
        P_RW = (Angular_momentum_RW + 39.56)/3.996;
        
        V_RW = M_RW/2800;
    
    % Power needed by sensors
        P_sensors = 10;
        
    % Total power needed
        P_ADCS = P_RW + P_sensors;
        
        Cost_ADCS = 464*M_ADCS^0.867;
        
    elseif Controller == 2 % Hydrazine thrusters
        T_thruster = Td*1.3;
        hd = T_thruster*(24*60*60/4)*0.707;
        theta_d = 0.1*pi/180;
        hp = T_thruster*24*60*60/(4*theta_d);
        Angular_momentum_thruster = hd + hp;
        if bus_config == 1 % Cylindrical
            FF = Angular_momentum_thruster/(r_structures);
        elseif bus_config == 2 % rectangular
            FF = Angular_momentum_thruster/(ws/2);
        end
        Isp = 200; % Hydrazine
        ge = 9.81;
        ro_prop = 1021;
        M_sensors = 3;
        P_sensors = 10;
        ro_pt = 2800;
        M_prop = FF*10000/(Isp*ge);
        V_p = 1.2*M_prop/ro_prop;
        dp = (6*V_p/pi)^(1/3);
        V_pt = (pi/6)*((dp+0.01)^3-(dp^3));
        M_pt = V_pt*ro_pt;
        M_ADCS = (M_pt + M_prop) + M_sensors;
        P_RW = 0;
        M_RW = M_pt+M_prop;
        P_ADCS = P_sensors;
        V_RW = V_pt;
        Angular_momentum_RW = 0;
        Cost_ADCS = 2.48*7*M_prop/0.453;
    end

ADCSoutput_SSL1 = [Cost_ADCS M_ADCS P_ADCS M_RW V_RW];

end