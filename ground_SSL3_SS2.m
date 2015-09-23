%% Ground station SSL3 SS2 (Ground receiving antenna)
function Groundoutput_SSL3_SS2 = ground_SSL3_SS2(f,Dground_rec,Ant_type_ground)

c = 2.9979*10^8;
lambda = c./f;
t_ground = 10*10^-2;
% Gt_sat = Transmitter satellite antenna gain
    eff_r_ground = 0.6;
    Gr_ground = (eff_r_ground)*(pi*Dground_rec/lambda)^2;
    
    if Ant_type_ground == 1 % Parabolic antenna
% Gt_sat = Transmitter satellite antenna gain
    eff_r_ground = 0.6;
    Gr_ground = (eff_r_ground)*(pi*Dground_rec/lambda)^2;
    M_ground_r = 2800*pi*t_ground*(Dground_rec/2)^2;
elseif Ant_type_ground == 2 % Helical antenna
      N = 10;
    S = 0.1;
    Gr_ground = 6.2*pi^2*Dground_rec^2*N*S*(f/c)^3;
    M_ground_r = 2800*N*(pi*Dground_rec+S)*t_ground;
end
    
Groundoutput_SSL3_SS2 = [Gr_ground M_ground_r];    
end    