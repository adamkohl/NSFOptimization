%% Payload SSL3 SS2 (Satellite Receiving antenna)
function Payloadoutput_SSL3_SS2 = payload_SSL3_SS2(fup,Dsat_rec,Ant_type)

c = 2.9979*10^8;
lambda_up = c./fup;

% Gr_sat = Transmitter satellite antenna gain
    eff_r_sat = 0.6;
    Gr_sat = (eff_r_sat)*(pi*Dsat_rec/lambda_up)^2;
    
     if Ant_type == 1 % Parabolic antenna
    eff_r_sat = 0.6;
    Gr_sat = (eff_r_sat)*(pi*Dsat_rec/lambda_up)^2;
    % Mass of satellite transmitting antenna
    tsat_ant = 3*10^-2; % thickness of satellite transmitting antenna
    M_payload_r = 2800*pi*tsat_ant*(Dsat_rec/2)^2;
   elseif Ant_type == 2 % Helical antenna
       N = 10;
       S = 0.05;
       Gr_sat = 6.2*pi^2*Dsat_rec^2*N*S*(fup/c)^3;
       % Mass of satellite transmitting antenna
        tsat_ant = 0.3*10^-2; % thickness of satellite transmitting antenna
        M_payload_r = 2800*N*(pi*Dsat_rec+S)*tsat_ant;
   end
% 
% % Mass of satellite transmitting antenna
%     tsat_ant = 3*10^-2; % thickness of satellite transmitting antenna
%     M_payload_r = 2800*pi*tsat_ant*(Dsat_rec/2)^2;

Payloadoutput_SSL3_SS2 = [Gr_sat M_payload_r];

end    
    
    