function Ground_SSL2_io = ground_SSL2_analysis(f,fup,h,Elevation,Pgt,Dground_trans,Dground_rec,Ant_type_ground)

Groundoutput_SSL2_SS1 = ground_SSL2_SS1(Pgt);
    Cost_ground_trans = Groundoutput_SSL2_SS1(1);
Groundoutput_SSL2_SS2 = ground_SSL2_SS2(f,fup,h,Elevation,Dground_trans,Dground_rec,Ant_type_ground);
    Cost_ground_trans_antenna = Groundoutput_SSL2_SS2(1);
    Gt_ground = Groundoutput_SSL2_SS2(2);
    L_s_up = Groundoutput_SSL2_SS2(3);
    Gr_ground = Groundoutput_SSL2_SS2(4);
    M_ground_t = Groundoutput_SSL2_SS2(5);
    M_ground_r = Groundoutput_SSL2_SS2(6);
    Cost_ground_rec_antenna = Groundoutput_SSL2_SS2(7);
    Aup = Groundoutput_SSL2_SS2(8);
    
Ground_SSL2_io = [Cost_ground_trans Cost_ground_trans_antenna Gt_ground L_s_up Gr_ground M_ground_t M_ground_r Cost_ground_rec_antenna Aup];
end