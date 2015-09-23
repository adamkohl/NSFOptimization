function Payload_SSL3_io = payload_SSL3_analysis(h,Elevation,fup,Dsat_rec,f,Dsat_trans,Ant_type,Elevation_r)


Payloadoutput_SSL3_SS2 = payload_SSL3_SS2(fup,Dsat_rec,Ant_type);
    Gr_sat = Payloadoutput_SSL3_SS2(1);
    M_payload_r = Payloadoutput_SSL3_SS2(2);
Payloadoutput_SSL3_SS1 = payload_SSL3_SS1(f,Dsat_trans,Elevation,h,Ant_type,Elevation_r);
    Gt_sat = Payloadoutput_SSL3_SS1(1);
    L_s = Payloadoutput_SSL3_SS1(2);
    M_payload_t = Payloadoutput_SSL3_SS1(3);
    A = Payloadoutput_SSL3_SS1(4);
    
    Payload_SSL3_io = [Gt_sat L_s M_payload_t M_payload_r Gr_sat A];
end
