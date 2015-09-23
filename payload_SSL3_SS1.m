%% Payload SSL 3 SS1 (Satellite Transmitting antenna)
function Payloadoutput_SSL3_SS1 = payload_SSL3_SS1(f,Dsat_trans,Elevation,h,Ant_type,Elevation_r)

h = h/(sind(Elevation_r));

c = 2.9979*10^8;
lambda = c./f;

% L_s = Space loss
    L_s = (c/(4*pi.*h.*f)).^2;
    
    
   if Ant_type == 1 % Parabolic antenna
 % Gt_sat = Transmitter satellite antenna gain
    eff_t_sat = 0.6;
    Gt_sat = (eff_t_sat)*(pi*Dsat_trans/lambda)^2;
    % Mass of satellite transmitting antenna
    tsat_ant = 3*10^-2; % thickness of satellite transmitting antenna
    M_payload_t = 2800*pi*tsat_ant*(Dsat_trans/2)^2;
   elseif Ant_type == 2 % Helical antenna
       N = 10;
       S = 0.05;
       Gt_sat = 6.2*pi^2*Dsat_trans^2*N*S*(f/c)^3;
       % Mass of satellite transmitting antenna
        tsat_ant = 0.3*10^-2; % thickness of satellite transmitting antenna
        M_payload_t = 2800*N*(pi*Dsat_trans+S)*tsat_ant;
   end


    
    if f>10*10^9
    A = (10*(6.8966*10^-12*f+0.93103)/10);
    else A = 0;
    end

Payloadoutput_SSL3_SS1 = [Gt_sat L_s M_payload_t A];

end









