%% Payload SSL2 SS2 (Satellite Antennae)
function Payloadoutput_SSL2_SS2 = payload_SSL2_SS2(h,Elevation,fup,Dsat_rec,f,Dsat_trans,Ant_type,Elevation_r)


Payload_SSL3_io = payload_SSL3_analysis(h,Elevation,fup,Dsat_rec,f,Dsat_trans,Ant_type,Elevation_r);
    Gt_sat = Payload_SSL3_io(1);
    L_s = Payload_SSL3_io(2);
    M_payload_t = Payload_SSL3_io(3);
    M_payload_r = Payload_SSL3_io(4);
    Gr_sat = Payload_SSL3_io(5);
    A = Payload_SSL3_io(6);

M_sat_antenna = M_payload_r + M_payload_t; 
if Ant_type == 1 % Parabolic antenna
    Cost_sat_antenna = 400*M_sat_antenna;
elseif Ant_type == 2 % Helical antenna
    Cost_sat_antenna = 2000*M_sat_antenna;
end

Payloadoutput_SSL2_SS2 = [M_sat_antenna Cost_sat_antenna Gt_sat L_s M_payload_t M_payload_r Gr_sat A];
end