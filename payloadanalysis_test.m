function [y] = payloadanalysis_test(x)
h = 3.5786000*10^7; 
operational_lifetime = 10;
f = x(1);
fup = x(2);
N = x(3);
Pst = x(4);
Pgt = x(5);
Dsat_trans = x(6);
Dsat_rec = x(7);
Dground_rec = x(8);
Dground_trans = x(9);
Sat_long = x(10);
Ground_long = x(11);
Ground_lat = x(12);
Amp = x(13);
Prop_tech = x(14);
Prop = x(15);
Batt = x(16);
SA_material = x(17);
a_e_SA = x(18);
a_e_trans_antenna = x(19);
a_e_rec_antenna = x(20);
a_e_bus = x(21);
eps_rad_battery = x(22);
eps_rad_RW = x(23);
eps_rad_tank = x(24);
bus_config = x(25);
bus_material = x(26);
Prop_tank_material = x(27);
launchsite = x(28);
Launch_vehicle = x(29);
Controller = x(30);

Gt_sat_new = 1;
Gr_ground_new = 1;
L_s_new = 1;
M_transponders_new = 10;
M_sat_antenna_new = 10;
M_payload_r_new = 10;
M_payload_t_new = 10;

Gt_sat_old = 0;
Gr_ground_old = 0;
L_s_old = 0;
M_transponders_old = 0;
M_sat_antenna_old = 0;
M_payload_r_old = 0;
M_payload_t_old = 0;

i = 0;
while (abs(Gt_sat_old-Gt_sat_new)>10^-6||...
        abs(Gr_ground_old-Gr_ground_new)>10^-6||...
        abs(L_s_old-L_s_new)>10^-6||...
        abs(M_transponders_old-M_transponders_new)>10^-6||...
        abs(M_sat_antenna_old-M_sat_antenna_new)>10^-6||...
        abs(M_payload_r_old-M_payload_r_new)>10^-6||...
        abs(M_payload_t_old-M_payload_t_new)>10^-6)
    
    i = i+1;
    
    Gt_sat_old = Gt_sat_new;
    Gr_ground_old = Gr_ground_new;
    L_s_old = L_s_new;
    M_transponders_old = M_transponders_new;
    M_sat_antenna_old = M_sat_antenna_new;
    M_payload_r_old = M_payload_r_new;
    M_payload_t_old = M_payload_t_new;

Payloadoutput_SSL1 = payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gt_sat_new,Gr_ground_new,L_s_new,M_transponders_new,M_sat_antenna_new);
    Elevation = Payloadoutput_SSL1(1);
    Eb_No_down = Payloadoutput_SSL1(2);
    SNRdown = Payloadoutput_SSL1(3);
    Cost_payload = Payloadoutput_SSL1(4);
    M_payload = Payloadoutput_SSL1(5);
Payloadoutput_SSL2_SS2 = payload_SSL2_SS2(M_payload_r_new,M_payload_t_new);
    M_sat_antenna_new = Payloadoutput_SSL2_SS2(1);
Payloadoutput_SSL2_SS1 = payload_SSL2_SS1(Amp,Pst,N);
    M_transponders_new = Payloadoutput_SSL2_SS1(1);
    P_payload = Payloadoutput_SSL2_SS1(2);
    V_trans = Payloadoutput_SSL2_SS1(3);
Payloadoutput_SSL3_SS2 = payload_SSL3_SS2(fup,Dsat_rec);
    Gr_sat = Payloadoutput_SSL3_SS2(1);
    M_payload_r_new = Payloadoutput_SSL3_SS2(2);
Payloadoutput_SSL3_SS1 = payload_SSL3_SS1(f,Dsat_trans,Elevation,h);
    Gt_sat_new = Payloadoutput_SSL3_SS1(1);
    L_s_new = Payloadoutput_SSL3_SS1(2);
    M_payload_t_new = Payloadoutput_SSL3_SS1(3);
    A = Payloadoutput_SSL3_SS1(4);
end

M_payload_t = M_payload_t_new
M_payload_r = M_payload_r_new
M_transponders = M_transponders_new
L_s = L_s_new
P_payload
Cost_payload
Eb_No_down
Elevation
Gr_sat
Gt_sat = Gt_sat_new

end