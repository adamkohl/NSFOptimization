function [delta011,delta012,delta111,delta112,delta211,delta212,delta221,delta311,delta312,delta321,delta322,...
    dV_dA_011,dV_dA_012,dV_dA_111,dV_dA_112,dV_dA_211,dV_dA_212,dV_dA_221,dV_dA_311,dV_dA_312,dV_dA_321,dV_dA_322] =...
    Scorecard_no_coupling(x)


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
  
%% System level score card

dV_dA_011 = -1;
dV_dA_012 = 1;

delta011 = -Total_cost*0.01;
delta012 = Total_revenue*0.01;


%% SSL1 Score card

    % SSL 1 SS 1

    delta111 = -Cost_payload*0.01;
    delta112 = SNRdown*0.01;
    
    
    dA_011_dA_111 = 1;
    dA_012_dA_111 = 0;
    dV_dA_111 = dV_dA_011 * dA_011_dA_111;
    

    
    dsatsystem_dA_112 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown+delta112,SNRup) - ...
                     satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
                        Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta112;
    dA_011_dA_112 = dsatsystem_dA_112(12);
    dA_012_dA_112 = dsatsystem_dA_112(11);
    
    dV_dA_112 = (dV_dA_011 * dA_011_dA_112) + (dV_dA_012 * dA_012_dA_112);

%% SSL2 Scorecard

    % SSL 2 SS1
    
    delta211 = -M_transponders*0.01;
    delta212 = P_payload*0.01;
    
    
                        if Amp == 1
                        dA_111_dA_211 = 500;
                        elseif Amp == 2
                            dA_111_dA_211 = 1000;
                        end
    dA_112_dA_211 = 0;
    
    dA_111_dA_212 = 0;
    dA_112_dA_212 = 0;
    
    dV_dA_211 = dV_dA_011 * (dA_011_dA_111 * dA_111_dA_211 + dA_011_dA_112 * dA_112_dA_211) + ...
                dV_dA_012 * (dA_012_dA_111 * dA_111_dA_211 + dA_012_dA_112 * dA_112_dA_211);
            
    dV_dA_212 = dV_dA_011 * (dA_011_dA_111 * dA_111_dA_212 + dA_011_dA_112 * dA_112_dA_212) + ...
                dV_dA_012 * (dA_012_dA_111 * dA_111_dA_212 + dA_012_dA_112 * dA_112_dA_212);  
            
    
    % SSL 2 SS2
    
    delta221 = -Cost_sat_antenna*0.01;
    
    dA_111_dA_221 = 1;
    dA_112_dA_221 = 0;
    dV_dA_221 = dV_dA_011 * (dA_011_dA_111 * dA_111_dA_221 + dA_011_dA_112 * dA_112_dA_221) + ...
                dV_dA_012 * (dA_012_dA_111 * dA_111_dA_221 + dA_012_dA_112 * dA_112_dA_221);

            
%% SSL3 Scorecard
    
    % SSL 3 SSL 1
    
    delta311 = Gt_sat*0.01;
    delta312 = -M_payload_t*0.01;
    
    dA_112_dA_311 = 162.339332589237e-006;
                                    if Ant_type == 1
                                        dA_221_dA_312 = 400;
                                    elseif Ant_type == 2
                                        dA_221_dA_312 = 2000;
                                    end
        

    dV_dA_311 = dV_dA_012 * dA_012_dA_112 * dA_112_dA_311;
    dV_dA_312 = dV_dA_011 * dA_011_dA_111 * dA_111_dA_221 * dA_221_dA_312;

    % SSL 3 SSL 2
    
    delta321 = Gr_sat*0.01;
    delta322 = -M_payload_r*0.01;
                                      if Ant_type == 1
                                         dA_221_dA_322 = 400;
                                        elseif Ant_type == 2
                                            dA_221_dA_322 = 2000;
                                        end
  
    dV_dA_321 = 0;
    dV_dA_322 = dV_dA_011 * dA_011_dA_111 * dA_111_dA_221 * dA_221_dA_322;
    
%         Gr_sat = 26.3558303176595e+003 + (26.3558303176595e+003*0.01);
% ground_SSL1(f,fup,h,Elevation,Ground_long,Ground_lat,Pgt,Gr_sat,Dground_trans,Dground_rec,Ant_type_ground)
% SNRup = 40.1965495100504e+000 + (40.1965495100504e+000*0.01);
% satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
%     Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup)
%
% M_ADCS =
% 
%     49.0581160066649e+000 

% Cost_ADCS =
% 
%     13.5632667057708e+003

% 
% Revenue_i = 222.977022083014e+006;
%  M_payload_t = 65.9734457253856-12;
% 
% 
% Array_size =28.8342328409038e+000;
% 
% 
% M_SA =67.1549282864649e+000;
% 

% L_structures =1.41294121552588e+000;
% 
% 
% r_structures =470.980405175292e-003;
% % 
% Iz =406.076809434036e+000+(406.076809434036e+000*0.01);
% Iy =126.696168855871e+000;
% mu = 3.986*10^14;  % in m^3/s^2
%         R  = (h+6374.4*10^3);   % orbital radius in m
%         theta = 1;
%         Tg = (3*mu*abs(Iz-Iy)*sind(2*theta))/(2*R^3)
% % 
% % Ix_structures =6.37629929758702e+000;
% % hs = 0;
% % ws = 0;
%   t_payload = 3*10^-2;
% Iy_structures= 6.37629929758702e+000;
%77.7910902524883e-009
% 


% ADCS_SSL1(Controller,M_payload_t,M_payload_r,L_structures,r_structures,...
%     hs,ws,Dsat_trans,Dsat_rec,Array_size,Ix_structures,Iy_structures,Iz_structures,bus_config,h,M_SA)
% 
%50.8387967122034e+000
% 
% 
% Iz = 406.076811395482e+000-(406.076811395482*0.01);
%         mu = 3.986*10^14;  % in m^3/s^2
%         R  = (h+6374.4*10^3);   % orbital radius in m
%         theta = 1;
%         Tg = (3*mu*abs(Iz-Iy)*sind(2*theta))/(2*R^3)
% 
% Tg =
% 
%     77.7910903931725e-009
%     % SSL 1 SS 3
%     
%     delta231 = 100;
%     
%     dsatsystem_dA_231 = (satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
%                         Cost_power+delta231,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup) - ...
%                      satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...    
%                         Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup))/delta231;
%     dA_111_dA_231 = dsatsystem_dA_231(12);
%     dA_112_dA_231 = dsatsystem_dA_231(11);              
%     dV_dA_231 = (dV_dA_111 * dA_111_dA_231) + (dV_dA_112 * dA_112_dA_231);
    
    
    
%     %% SSL 3 SS 4
%     
%     delta341 = 1000;
%     dA_111_dA_241 = 0;
%     dA_112_dA_241 = 0;
%     h = 3.5786000*10^7; 
%     dA_241_dA_341 = 0;
%     dV_dA_341 = (dV_dA_111 * dA_111_dA_241 * dA_241_dA_341) + (dV_dA_112 * dA_112_dA_241 * dA_241_dA_341);
%     
%     Gr_ground = 18.2578042059394e+006;
%     dSNRd_dA_341 = (payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground+delta341,Ant_type,f,fup,Dsat_trans,Dsat_rec)-...
%                     payload_SSL1(N,Amp,Sat_long,Ground_long,Ground_lat,h,Pst,Gr_ground,Ant_type,f,fup,Dsat_trans,Dsat_rec))/delta341;
%     dA_213_dA_341 = dSNRd_dA_341(15);
%     
% dV_dA_341_with = dV_dA_341 + (dV_dA_111 * dA_111_dA_213 * dA_213_dA_341) + ...
%                 (dV_dA_112 * dA_112_dA_213 * dA_213_dA_341);
    
end
    