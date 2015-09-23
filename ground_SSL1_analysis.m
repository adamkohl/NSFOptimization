function Ground_SSL1_io = ground_SSL1_analysis(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground)

Groundoutput_SSL1 = ground_SSL1(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground);
    Cost_groundstation = Groundoutput_SSL1(1);
    Eb_No_up = Groundoutput_SSL1(2);
    Cost_ground_trans = Groundoutput_SSL1(3);
    Cost_ground_antenna = Groundoutput_SSL1(4);
    Gt_ground = Groundoutput_SSL1(5);
    L_s_up = Groundoutput_SSL1(6);
    Gr_ground = Groundoutput_SSL1(7);
    M_ground_t = Groundoutput_SSL1(8);
    M_ground_r = Groundoutput_SSL1(9);
    SNRup = Groundoutput_SSL1(10);

Ground_SSL1_io = [Cost_groundstation Eb_No_up Cost_ground_trans Cost_ground_antenna Gt_ground L_s_up Gr_ground M_ground_t M_ground_r SNRup]; 
end