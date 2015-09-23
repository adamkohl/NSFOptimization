function Payload_io = payloadanalysis(f,fup,N,Pst,Dsat_trans,Dsat_rec,Sat_long,Ground_long,Ground_lat,...
    Amp,Gr_ground,Ant_type)
h = 3.5786000*10^7; 

Gt_sat_new = 1;
L_s_new = 1;
M_transponders_new = 10;
Cost_sat_antenna_new = 10;
M_payload_r_new = 10;
M_payload_t_new = 10;
M_sat_antenna_new = 10;

Gt_sat_old = 0;
L_s_old = 0;
M_transponders_old = 0;
Cost_sat_antenna_old = 0;
M_payload_r_old = 0;
M_payload_t_old = 0;
M_sat_antenna_old = 0;

i = 0;
while (abs(Gt_sat_old-Gt_sat_new)>10^-6||...
        abs(L_s_old-L_s_new)>10^-6||...
        abs(M_transponders_old-M_transponders_new)>10^-6||...
        abs(Cost_sat_antenna_old-Cost_sat_antenna_new)>10^-6||...
        abs(M_payload_r_old-M_payload_r_new)>10^-6||...
        abs(M_payload_t_old-M_payload_t_new)>10^-6)
    
    i = i+1;
    
    Gt_sat_old = Gt_sat_new;
    L_s_old = L_s_new;
    M_transponders_old = M_transponders_new;
    Cost_sat_antenna_old = Cost_sat_antenna_new;
    M_payload_r_old = M_payload_r_new;
    M_payload_t_old = M_payload_t_new;


Payload_SSL1_io = payload_SSL1_analysis(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gt_sat_new,Gr_ground,L_s_new,M_transponders_new,M_sat_antenna_new,Cost_sat_antenna_new);
    Elevation_1 = Payload_SSL1_io(1);
    Eb_No_down = Payload_SSL1_io(2);
    Cost_payload = Payload_SSL1_io(3);
    M_payload = Payload_SSL1_io(4);
Payload_SSL2_io = payload_SSL2_analysis(Amp,Pst,N,Ant_type,M_payload_r_new,M_payload_t_new,Elevation_1);
    M_transponders_new = Payload_SSL2_io(1);
    P_payload = Payload_SSL2_io(2);
    V_trans = Payload_SSL2_io(3);
    M_sat_antenna_new = Payload_SSL2_io(4);
    Cost_sat_antenna_new = Payload_SSL2_io(6);
    Elevation = Payload_SSL2_io(5);
Payload_SSL3_io = payload_SSL3_analysis(h,Elevation,fup,Dsat_rec,f,Dsat_trans,Ant_type);
    Gt_sat_new = Payload_SSL3_io(1);
    L_s_new = Payload_SSL3_io(2);
    M_payload_t_new = Payload_SSL3_io(3);
    M_payload_r_new = Payload_SSL3_io(4);
    Gr_sat_new = Payload_SSL3_io(5);
end
    M_payload_t = M_payload_t_new;
M_payload_r = M_payload_r_new;
M_transponders = M_transponders_new;
L_s = L_s_new;
P_payload;
Cost_payload;
Eb_No_down;
Elevation;
Gr_sat = Gr_sat_new;
Gt_sat = Gt_sat_new;
Elevation;
V_trans;
Cost_sat_antenna = Cost_sat_antenna_new;
M_sat_antenna = M_sat_antenna_new;

Payload_io = [Elevation Cost_payload Eb_No_down M_transponders V_trans P_payload M_sat_antenna Gt_sat L_s M_payload_t Gr_sat M_payload_r M_payload Cost_sat_antenna];

end

