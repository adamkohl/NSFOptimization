function Ground_SSL3_io = ground_SSL3_analysis(f,fup,h,Dground_trans,Dground_rec,Elevation,Ant_type_ground)

Groundoutput_SSL3_SS1 = ground_SSL3_SS1(Elevation,fup,h,Dground_trans,Ant_type_ground);
    Gt_ground = Groundoutput_SSL3_SS1(1);
    L_s_up = Groundoutput_SSL3_SS1(2);  
    Aup = Groundoutput_SSL3_SS1(3);  
    M_ground_t = Groundoutput_SSL3_SS1(4);  
Groundoutput_SSL3_SS2 = ground_SSL3_SS2(f,Dground_rec,Ant_type_ground);
    Gr_ground = Groundoutput_SSL3_SS2(1);
    M_ground_r = Groundoutput_SSL3_SS2(2);
    
    Ground_SSL3_io = [Gt_ground L_s_up Gr_ground M_ground_t M_ground_r Aup];
    
end