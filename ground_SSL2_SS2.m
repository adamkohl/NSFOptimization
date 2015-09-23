%% Ground station SSL2 SS2 (Ground antennae)
function Groundoutput_SSL2_SS2 = ground_SSL2_SS2(f,fup,h,Elevation,Dground_trans,Dground_rec,Ant_type_ground)

Ground_SSL3_io = ground_SSL3_analysis(f,fup,h,Dground_trans,Dground_rec,Elevation,Ant_type_ground);
    Gt_ground = Ground_SSL3_io(1);
    L_s_up = Ground_SSL3_io(2);
    Gr_ground = Ground_SSL3_io(3);
    M_ground_t = Ground_SSL3_io(4);
    M_ground_r = Ground_SSL3_io(5);
    Aup = Ground_SSL3_io(6);


% Cost of ground antennae
    
    if Ant_type_ground == 1 % Parabolic antenna
        Cost_ground_trans_antenna = 10*(M_ground_t);
        Cost_ground_rec_antenna = 10*(M_ground_r);
    elseif Ant_type_ground == 2 % Helical antenna
        Cost_ground_trans_antenna = 50*(M_ground_t);
        Cost_ground_rec_antenna = 10*(M_ground_r);
    end
    
Groundoutput_SSL2_SS2 = [Cost_ground_trans_antenna Gt_ground L_s_up Gr_ground M_ground_t M_ground_r Cost_ground_rec_antenna Aup];    
end