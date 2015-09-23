function[delta011_with,delta012_with,delta111_with,delta112_with,delta211_with,delta212_with,delta221_with,delta311_with,...
    delta312_with,delta321_with,delta322_with,dV_dA_011_with,dV_dA_012_with,dV_dA_111_with,dV_dA_112_with,...
    dV_dA_211_with,dV_dA_212_with,dV_dA_221_with,dV_dA_311_with,dV_dA_312_with,dV_dA_321_with,dV_dA_322_with] =...
    Scorecard_with(x)

h = 3.5786000*10^7; 
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
Ground_long_r = x(13);
Ground_lat_r = x(14);
Amp = x(15);
Prop_tech = x(16);
Prop = x(17);
Batt = x(18);
SA_material = x(19);
a_e_SA = x(20);
a_e_trans_antenna = x(21);
a_e_rec_antenna = x(22);
a_e_bus = x(23);
eps_rad_battery = x(24);
eps_rad_RW = x(25);
eps_rad_tank = x(26);
bus_config = x(27);
bus_material = x(28);
Prop_tank_material = x(29);
launchsite = x(30);
Launch_vehicle = x(31);
Controller = x(32);
Ant_type = x(33);
Ant_type_ground = x(34);
Power = x(35);
Thermal = x(36);

Sat_system_analysis_out = sat_system_analysis(f,fup,N,Pst,Pgt,Dsat_trans,Dsat_rec,Dground_trans,Dground_rec,Sat_long,Ground_long,Ground_lat,...
      Amp,Prop_tech,Prop,Batt,SA_material,a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,...
      eps_rad_battery,eps_rad_RW,eps_rad_tank,bus_config,bus_material,Prop_tank_material,launchsite,Launch_vehicle,Controller,Ant_type,Ant_type_ground,...
      Power,Thermal,Ground_long_r,Ground_lat_r);
  Eb_No_down = Sat_system_analysis_out(1);
  Eb_No_up = Sat_system_analysis_out(2);
  Cost_payload = Sat_system_analysis_out(3);
  Cost_groundstation = Sat_system_analysis_out(4);
  Cost_propulsion = Sat_system_analysis_out(5);
  Cost_power = Sat_system_analysis_out(6);
  Cost_ADCS= Sat_system_analysis_out(7);
  Cost_thermal = Sat_system_analysis_out(8);
  Cost_structures = Sat_system_analysis_out(9);
  Cost_lv = Sat_system_analysis_out(10);
  Spacecraft_mass = Sat_system_analysis_out(15);
  SNRdown = Sat_system_analysis_out(17);
  SNRup = Sat_system_analysis_out(18);
  M_transponders = Sat_system_analysis_out(19);
  P_payload = Sat_system_analysis_out(20);
  Cost_sat_antenna = Sat_system_analysis_out(21);
  Gt_sat = Sat_system_analysis_out(22);
  L_s = Sat_system_analysis_out(23);
  M_payload_t = Sat_system_analysis_out(24);
  Gr_sat = Sat_system_analysis_out(25);
  M_payload_r = Sat_system_analysis_out(26);
Satsystemout = satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
    Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup);  
  Total_revenue = Satsystemout(11);
Total_cost = Satsystemout(12);
  
%% System level scorecard
dV_dA_011 = -1;
dV_dA_012 = 1;
dV_dA_011_with = dV_dA_011;
dV_dA_012_with = dV_dA_012;

delta011_with = -Total_cost*0.01;
delta012_with = Total_revenue*0.01;

%% SSL1 Scorecard

    % SSL 1 SS 1

    delta111_with = -Cost_payload*0.01;
    delta112_with = SNRdown*0.01;
    
    
    dA_011_dA_111 = 1;
    dA_012_dA_111 = 0;
    dV_dA_111_with = dV_dA_011* dA_011_dA_111;
    

    
    dsatsystem_dA_112 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown+delta112_with,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta112_with;
    dA_011_dA_112 = dsatsystem_dA_112(12);
    dA_012_dA_112 = dsatsystem_dA_112(11);
    
    dV_dA_112_with = (dV_dA_012 * dA_012_dA_112);

%% SSL2 Scorecard

    % SSL 2 SS1
    
    delta211_with = -M_transponders;
    delta212_with = P_payload*0.01;
   
    dA_111_dA_212 = 0;
    dA_112_dA_212 = 0;
    
    dA_111_dCtrans = 1;
                        if Amp == 1
                        dCtrans_dA_211 = 500;
                        elseif Amp == 2
                            dCtrans_dA_211 = 1000;
                        end
    dCtrans_dA_211_with = dCtrans_dA_211;
    dA_011_dA_211_with = dA_011_dA_111 * dA_111_dCtrans * dCtrans_dA_211_with;
    dV_dA_211_with = dV_dA_011 * dA_011_dA_211_with;
    
    dCpower_dCbatt = 1;
    dPo_dPpay = 1;
    if Batt == 1
        dBatt_capacity_dPo = 2.5531;
    elseif Batt == 2
        dBatt_capacity_dPo = 1.8237;
    elseif Batt == 3
        dBatt_capacity_dPo = 5.10638;
    end
    dBatt_capacity_dPpay_with = dBatt_capacity_dPo * dPo_dPpay;
                        if Batt == 1
                        dBatt_mass_dBatt_capacity = 1/40;
                        elseif Batt == 2
                            dBatt_mass_dBatt_capacity = 1/60;
                        elseif Batt == 3
                            dBatt_mass_dBatt_capacity = 1/130;
                        end
        
    dBatt_mass_dPpay_with = dBatt_mass_dBatt_capacity * dBatt_capacity_dPpay_with;
                        if Batt == 1
                            dCbatt_dBatt_mass = 1000*40;
                        elseif Batt == 2
                            dCbatt_dBatt_mass = 1500*60;
                        elseif Batt == 3
                            dCbatt_dBatt_mass = 1200*130;
                        end
        
    dCbatt_dPpay_with = dCbatt_dBatt_mass * dBatt_mass_dPpay_with;
    dCpower_dCsa = 1;
                        if SA_material == 1
                            dPsa_dPo = 1.06085982764515;
                        elseif SA_material == 2
                             dPsa_dPo = 1.06085982764474;
                        elseif SA_material == 3
                             dPsa_dPo = 1.06085982764474;
                        end
    dPo_dPpay_with = dPo_dPpay;                    
    dPsa_dPpay_with = dPsa_dPo * dPo_dPpay_with;
                        if SA_material == 1
                            dCsa_dPsa = 5;
                        elseif SA_material == 2
                            dCsa_dPsa = 20;
                        elseif SA_material == 3
                            dCsa_dPsa = 250;
                        end
    dCsa_dPay_with = dCsa_dPsa * dPsa_dPpay_with;
    dA_011_dA_131 = 1;
    dA_131_dA_212_with = dCpower_dCbatt * dCbatt_dPpay_with  + dCpower_dCsa * dCsa_dPay_with;
    dA_011_dA_211_with = dA_011_dA_131 * dA_131_dA_212_with;
    dV_dA_212_with = dV_dA_011 * dA_011_dA_211_with;
            
    
    % SSL 2 SS2
    delta221_with = -Cost_sat_antenna*0.01;
    dA_111_dA_221 = 1;
    dA_112_dA_221 = 0;
    dA_111_dA_221_with = dA_111_dA_221;
    dV_dA_221_with = dV_dA_011 * dA_011_dA_111 * dA_111_dA_221_with;
    
    
%% SSL3 Scorecard
    
    % SSL 3 SSL 1
    delta311_with = Gt_sat*0.01;
    delta312_with = -M_payload_t*0.01;
    
    dA_112_dA_311 = 162.339332589237e-006;
                             if Ant_type == 1
                                dA_221_dA_312 = 400;
                             elseif Ant_type == 2
                                dA_221_dA_312 = 2000;
                             end
    
    dA_112_dA_311_with = dA_112_dA_311;
    dV_dA_311_with = dV_dA_012 * dA_012_dA_112 * dA_112_dA_311_with;
    
    dCpay_dCsat_ant = 1;
                            if Ant_type == 1
                                dCsat_ant_dMsat_ant = 400;
                            elseif Ant_type == 2
                                dCsat_ant_dMsat_ant = 2000;
                            end
    dMsat_ant_dMst = 1;                        
    dMsat_ant_dMst_with = dMsat_ant_dMst;                        
    dCsat_ant_dMst_with = dCsat_ant_dMsat_ant * dMsat_ant_dMst_with;
    dA_111_dA_312_with = dCpay_dCsat_ant * dCsat_ant_dMst_with;
    dA_011_dA_151 = 1;
    
    dC_ADCS_dM_ADCS =  239.543648980803e+000;
    dIy_st_dMst = 770.594837865932e-003;
    dIz_st_dMst = 707.568252041866e-006;
    dIy_st_dMst_with = dIy_st_dMst;
    dIz_st_dMst_with = dIz_st_dMst;
    dIy_dIy_st = 1;
    dIz_dIz_st = 1;
    dIy_dMst_with = dIy_dIy_st * dIy_st_dMst_with;
    dIz_dMst_with = dIz_dIz_st * dIz_st_dMst_with;
    dTg_dIy = -278.441233764393e-012;
    dTg_dIz = 278.441233764465e-012;
    dTg_dMst_with = (dTg_dIy * dIy_dMst_with) + (dTg_dIz * dIz_dMst_with);
    dTd_dTg = 1;
    dTd_dMst_with = dTd_dTg * dTg_dMst_with;
    dT_RW_dTd = 1.3;
    dT_RW_dMst_with = dT_RW_dTd * dTd_dMst_with;
    dhd_dT_RW = (24*60*60/4)*0.707;
    dhd_dMst_with = dhd_dT_RW * dT_RW_dMst_with;
                theta_d = 0.1*pi/180;
    dhp_dT_RW = 24*60*60/(4*theta_d);
    dhp_dMst_with = dhp_dT_RW * dT_RW_dMst_with;
    dh_RW_dhd = 1;
    dh_RW_dhp = 1;
    dh_RW_dMst_with = (dh_RW_dhd * dhd_dMst_with) + (dh_RW_dhp * dhp_dMst_with);
    dM_ADCS_dh_RW = 1/22.2; 
    dM_ADCS_dMst_with = dM_ADCS_dh_RW * dh_RW_dMst_with;
    dA_151_dA_312_with = dC_ADCS_dM_ADCS * dM_ADCS_dMst_with;
    dA_011_dA_312_with = (dA_011_dA_111 * dA_111_dA_312_with) + (dA_011_dA_151 * dA_151_dA_312_with);
    dV_dA_312_with = dV_dA_011 * dA_011_dA_312_with;

    % SSL 3 SSL 2

    Gr_sat;
    delta321_with = Gr_sat*0.01;
    delta322_with = -M_payload_r*0.01;

                                        if Ant_type == 1
                                         dA_221_dA_322 = 400;
                                        elseif Ant_type == 2
                                            dA_221_dA_322 = 2000;
                                        end 
    delta122 = SNRup*0.01;
 dsatsystem_dA_122 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup+delta122) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta122;                                       
    dA_012_dA_122 = dsatsystem_dA_122(11);
    dA_122_dA_321 = 163.962725915123e-006;
    dA_122_dA_321_with = dA_122_dA_321;
    dA_012_dA_321_with = dA_012_dA_122 * dA_122_dA_321_with;
    dV_dA_321_with = dV_dA_012 * dA_012_dA_321_with;
    
    

    dV_dA_322_with = dV_dA_312_with;
    
%     Elevation = -18.8454829482840e+000;
%     Elevation_r = 15.1561466918274e+000;
%     Gr_sat =26.3558303176595e+003+(26.3558303176595e+003*0.01);
%     ground_SSL1(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground,Elevation_r,...
%                                         Ground_long_r,Ground_lat_r)
% 40.1965495100504e+000
    

end