%% Ground station SSL3 SS1 (Ground Transmitting antenna)
function Groundoutput_SSL3_SS1 = ground_SSL3_SS1(Elevation,fup,h,Dground_trans,Ant_type_ground)

h = h/(sind(Elevation));

c = 2.9979*10^8;
lambda_up = c./fup;

% L_s_up = Space loss
    L_s_up = (c/(4*pi.*h.*fup)).^2;
    t_ground = 10*10^-2;
    
if Ant_type_ground == 1 % Parabolic antenna
% Gt_sat = Transmitter satellite antenna gain
    eff_t_ground = 0.6;
    Gt_ground = (eff_t_ground)*(pi*Dground_trans/lambda_up)^2;
    M_ground_t = 2800*pi*t_ground*(Dground_trans/2)^2;
elseif Ant_type_ground == 2 % Helical antenna
    N = 10;
    S = 0.1;
    Gt_ground = 6.2*pi^2*Dground_trans^2*N*S*(fup/c)^3;
    M_ground_t = 2800*N*(pi*Dground_trans+S)*t_ground;
end
    
    if fup>10*10^9
    Aup = (10*(6.8966*10^-12*fup+0.93103)/10);
    else Aup = 0;
    end
    
   
Groundoutput_SSL3_SS1 = [Gt_ground L_s_up Aup M_ground_t];    
end