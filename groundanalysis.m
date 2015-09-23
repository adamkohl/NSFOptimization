function Ground_io = groundanalysis(f,fup,Pgt,Ground_long,Ground_lat,Dground_trans,Dground_rec,...
    Elevation,Gr_sat,Ant_type_ground)
h = 3.5786000*10^7; 

L_s_up_new = 1;
Gt_ground_new = 1;
Cost_ground_antenna_new = 10;
Cost_ground_trans_new = 10;

L_s_up_old = 0;
Gt_ground_old = 0;
Cost_ground_antenna_old = 0;
Cost_ground_trans_old = 0;

i = 0;
while(abs(L_s_up_old-L_s_up_new)>10^-6||...
      abs(Gt_ground_old-Gt_ground_new)>10^-6||...
      abs(Cost_ground_antenna_old-Cost_ground_antenna_new)>10^-6||...
      abs(Cost_ground_trans_old-Cost_ground_trans_new)>10^-6)
i = i+1;

L_s_up_old = L_s_up_new;
Gt_ground_old = Gt_ground_new;
Cost_ground_antenna_old = Cost_ground_antenna_new;
Cost_ground_trans_old = Cost_ground_trans_new;


Ground_SSL1_io = ground_SSL1_analysis(Ground_long,Ground_lat,Pgt,fup,L_s_up_new,Gr_sat,...
    Gt_ground_new,Cost_ground_antenna_new,Cost_ground_trans_new);
   Cost_groundstation = Ground_SSL1_io(1);
   Eb_No_up = Ground_SSL1_io(2);
Ground_SSL2_io = ground_SSL2_analysis(Pgt,Dground_trans,Dground_rec,Ant_type_ground);
    Cost_ground_trans_new = Ground_SSL2_io(1);
    Cost_ground_antenna_new = Ground_SSL2_io(2);
Ground_SSL3_io = ground_SSL3_analysis(f,fup,h,Dground_trans,Dground_rec,Elevation,Ant_type_ground);
    Gt_ground_new = Ground_SSL3_io(1);
    L_s_up_new = Ground_SSL3_io(2);
    Gr_ground = Ground_SSL3_io(3);
    
end
Cost_groundstation;
Eb_No_up;
Gr_ground;
L_s_up = L_s_up_new;
Gt_ground = Gt_ground_new;
Cost_ground_antenna = Cost_ground_antenna_new;
Cost_ground_trans = Cost_ground_trans_new;

Ground_io = [Cost_groundstation Eb_No_up Cost_ground_trans Cost_ground_antenna Gt_ground L_s_up Gr_ground];
end