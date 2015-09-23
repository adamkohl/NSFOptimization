%% Groundstation SSL1
function Groundoutput_SSL1 = ground_SSL1(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground,Elevation_r,...
                                        Ground_long_r,Ground_lat_r)

Ground_SSL2_io = ground_SSL2_analysis(f,fup,h,Elevation,Pgt,Dground_trans,Dground_rec,Ant_type_ground);
    Cost_ground_trans = Ground_SSL2_io(1);
    Cost_ground_trans_antenna = Ground_SSL2_io(2);
    Gt_ground = Ground_SSL2_io(3);
    L_s_up = Ground_SSL2_io(4);
    Gr_ground = Ground_SSL2_io(5);
    M_ground_t = Ground_SSL2_io(6);
    M_ground_r = Ground_SSL2_io(7);
    Cost_ground_rec_antenna = Ground_SSL2_io(8);
    Aup = Ground_SSL2_io(9);

Ts_up = 614;
c = 2.9979*10^8;
L_lt = .89;
L_a  = 0.89;
L_lr = .89;
kb = 1.3807*10^-23;
R_up = 8*10^6;

% SNRup
Eb_No_up = (Pgt*L_lt*Gt_ground*L_s_up*L_a*Gr_sat*L_lr)/(kb*Ts_up*R_up);

%     Eb_No_up = Eb_No_up/Aup;


    SNRup = 10*log10(Eb_No_up)-Aup;
    
    
if Ground_long >=66 & Ground_long <=80
    if Ground_lat >=25 & Ground_lat <= 35
    % Cost of ground station
        Cost_groundstation_t = 10*(Cost_ground_trans + Cost_ground_trans_antenna);
    elseif Ground_lat > 35 & Ground_lat <= 50
        Cost_groundstation_t = 8*(Cost_ground_trans + Cost_ground_trans_antenna);
    end
elseif Ground_long > 80 & Ground_long <=90
    if Ground_lat >=25 & Ground_lat <= 35
    % Cost of ground station
        Cost_groundstation_t = 2*(Cost_ground_trans + Cost_ground_trans_antenna);
    elseif Ground_lat > 35 & Ground_lat <= 50
        Cost_groundstation_t = 1.5*(Cost_ground_trans + Cost_ground_trans_antenna);
    end
elseif Ground_long > 90 & Ground_long <=110
    if Ground_lat >=25 & Ground_lat <= 35
    % Cost of ground station
        Cost_groundstation_t = 2.5*(Cost_ground_trans + Cost_ground_trans_antenna);
    elseif Ground_lat > 35 & Ground_lat <= 50
        Cost_groundstation_t = (Cost_ground_trans + Cost_ground_trans_antenna);
    end
elseif Ground_long >110 & Ground_long <=125
    if Ground_lat >=25 & Ground_lat <= 35
    % Cost of ground station
        Cost_groundstation_t = 11*(Cost_ground_trans + Cost_ground_trans_antenna);
    elseif Ground_lat > 35 & Ground_lat <= 50
        Cost_groundstation_t = 2*(Cost_ground_trans + Cost_ground_trans_antenna);
    end
end

Cost_groundstation_r = 0;
if Ground_long_r >=66 & Ground_long_r <=80
    if Ground_lat_r >=25 & Ground_lat_r <= 35
    % Cost of ground station
        Cost_groundstation_r = 10*(Cost_ground_rec_antenna);
    elseif Ground_lat_r > 35 & Ground_lat_r <= 50
        Cost_groundstation_r = 8*(Cost_ground_rec_antenna);
    end
elseif Ground_long_r > 80 & Ground_long_r <=90
    if Ground_lat >=25 & Ground_lat <= 35
    % Cost of ground station
        Cost_groundstation_r = 2*(Cost_ground_rec_antenna);
    elseif Ground_lat_r > 35 & Ground_lat_r <= 50
        Cost_groundstation_r = 1.5*(Cost_ground_rec_antenna);
    end
elseif Ground_long_r > 90 & Ground_long_r <=110
    if Ground_lat_r >=25 & Ground_lat_r <= 35
    % Cost of ground station
        Cost_groundstation_r = 2.5*(Cost_ground_rec_antenna);
    elseif Ground_lat_r > 35 & Ground_lat_r <= 50
        Cost_groundstation_r = (Cost_ground_rec_antenna);
    end
elseif Ground_long_r >110 & Ground_long_r <=125
    if Ground_lat_r >=25 & Ground_lat_r <= 35
    % Cost of ground station
        Cost_groundstation_r = 11*(Cost_ground_rec_antenna);
    elseif Ground_lat_r > 35 & Ground_lat_r <= 50
        Cost_groundstation_r = 2*(Cost_ground_rec_antenna);
    end
end
Cost_groundstation_r;
Cost_ground_antenna = Cost_ground_trans_antenna + Cost_ground_rec_antenna;
Cost_groundstation = Cost_groundstation_t + Cost_groundstation_r;
           
Groundoutput_SSL1 = [Cost_groundstation Eb_No_up Cost_ground_trans Cost_ground_antenna Gt_ground L_s_up Gr_ground M_ground_t M_ground_r SNRup]; 
end