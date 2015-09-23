function Payload_SSL1_io = payload_SSL1_analysis(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground,...
    Ant_type,f,fup,Dsat_trans,Dsat_rec)

Payloadoutput_SSL1 = payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground,Ant_type,...
    f,fup,Dsat_trans,Dsat_rec);
    Elevation = Payloadoutput_SSL1(1);
    Cost_payload = Payloadoutput_SSL1(2);
    Eb_No_down = Payloadoutput_SSL1(3);
    M_transponders = Payloadoutput_SSL1(4);
    V_trans = Payloadoutput_SSL1(5);
    P_payload = Payloadoutput_SSL1(6);
    M_sat_antenna = Payloadoutput_SSL1(7);
    Gt_sat = Payloadoutput_SSL1(8);
    L_s = Payloadoutput_SSL1(9);
    M_payload_t = Payloadoutput_SSL1(10);
    Gr_sat = Payloadoutput_SSL1(11);
    M_payload_r = Payloadoutput_SSL1(12);
    M_payload = Payloadoutput_SSL1(13);
    Cost_sat_antenna = Payloadoutput_SSL1(14);
    SNRdown = Payloadoutput_SSL1(15);
    
Payload_SSL1_io = [Elevation Cost_payload Eb_No_down M_transponders V_trans P_payload ...
                     M_sat_antenna Gt_sat L_s M_payload_t Gr_sat M_payload_r M_payload Cost_sat_antenna SNRdown];
end

