function Payload_SSL2_io = payload_SSL2_analysis(h,Amp,Pst,N,Ant_type,Elevation,f,fup,Dsat_trans,Dsat_rec,Elevation_r)

Payloadoutput_SSL2_SS1 = payload_SSL2_SS1(Amp,Pst,N);
    M_transponders = Payloadoutput_SSL2_SS1(1);
    P_payload = Payloadoutput_SSL2_SS1(2);
    V_trans = Payloadoutput_SSL2_SS1(3);
Payloadoutput_SSL2_SS2 = payload_SSL2_SS2(h,Elevation,fup,Dsat_rec,f,Dsat_trans,Ant_type,Elevation_r);
    M_sat_antenna = Payloadoutput_SSL2_SS2(1);
    Cost_sat_antenna = Payloadoutput_SSL2_SS2(2);
    Gt_sat = Payloadoutput_SSL2_SS2(3);
    L_s = Payloadoutput_SSL2_SS2(4);
    M_payload_t = Payloadoutput_SSL2_SS2(5);
    M_payload_r = Payloadoutput_SSL2_SS2(6);
    Gr_sat = Payloadoutput_SSL2_SS2(7);
    A = Payloadoutput_SSL2_SS2(8);
%     Elevation = Elevation_1;
    Payload_SSL2_io = [M_transponders P_payload V_trans M_sat_antenna Elevation Cost_sat_antenna Gt_sat L_s M_payload_t M_payload_r Gr_sat A];
end