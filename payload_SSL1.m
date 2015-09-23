%% Payload SSl 1

function Payloadoutput_SSL1 = payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground,Ant_type,f,fup,Dsat_trans,Dsat_rec,...
                                            Ground_long_r,Ground_lat_r)

G = Sat_long-Ground_long;

Elevation = 180/pi*(atan((cosd(G)*cosd(Ground_lat)-0.1512)/(sqrt(1-((cosd(G)).^2*(cosd(Ground_lat)).^2)))));

Gr = Sat_long-Ground_long_r;

Elevation_r = 180/pi*(atan((cosd(Gr)*cosd(Ground_lat_r)-0.1512)/(sqrt(1-((cosd(Gr)).^2*(cosd(Ground_lat_r)).^2)))));

Payload_SSL2_io = payload_SSL2_analysis(h,Amp,Pst,N,Ant_type,Elevation,f,fup,Dsat_trans,Dsat_rec,Elevation_r);
    M_transponders = Payload_SSL2_io(1);
    P_payload = Payload_SSL2_io(2);
    V_trans = Payload_SSL2_io(3);
    M_sat_antenna = Payload_SSL2_io(4);
    Cost_sat_antenna = Payload_SSL2_io(6);
    Gt_sat = Payload_SSL2_io(7);
    L_s = Payload_SSL2_io(8);
    M_payload_t = Payload_SSL2_io(9);
    M_payload_r = Payload_SSL2_io(10);
    Gr_sat = Payload_SSL2_io(11);
    A = Payload_SSL2_io(12);
% h = h/(sind(Elevation))


% L_lt = Line loss between transmitter & antenna
    L_lt = .89;
  
% L_a  = Transmission path loss
    L_a  = 0.89;
    
% L_lr = Line loss between receiver & antenna
    L_lr = .89;

% kb = Boltzmann constant in m^2 kg s^-2 K-1
    kb = 1.3807*10^-23;
    
% R = Desired bits/second 
    R = 8*10^6;
    
% Ts = System noise temperature in K
    Ts_down = 424;
  
% SNRdown

    Eb_No_down = ((Pst)*L_lt*Gt_sat*L_s*L_a*Gr_ground*L_lr)/(kb*Ts_down*R);
   
%     Eb_No_down = Eb_No_down/A;
    SNRdown = 10*log10(Eb_No_down)-A;
    
% Mass of payload
    M_payload = M_transponders + M_sat_antenna;

% Cost of paylaod
    if Amp == 1 % SSA
        Cost_transponders = 500*M_transponders;
    elseif Amp == 2 % TWTA
        Cost_transponders = 1000*M_transponders;
    end

    Cost_payload = Cost_sat_antenna + Cost_transponders;
%     M_payload = M_transponders + M_sat_antenna;

Payloadoutput_SSL1 = [Elevation Cost_payload Eb_No_down M_transponders V_trans P_payload ...
                     M_sat_antenna Gt_sat L_s M_payload_t Gr_sat M_payload_r M_payload Cost_sat_antenna SNRdown Elevation_r];


end