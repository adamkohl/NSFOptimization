%% Thermal SSL2_SS1 (Thermal finish)
function Thermaloutput_SSL2_SS1 = thermal_SSL2_SS1(a_e_SA,a_e_trans_antenna,a_e_rec_antenna,a_e_bus,Controller,Array_size,...
    Dsat_trans,Dsat_rec,L_structures,r_structures,hs,ws,bus_config)


    T_battery = 15;
    T_sensors = 30;
    T_antenna = 100;
    T_SA = 110;
    T_bus = 50;
    T_tank = 40;
   
    
    T_battery_min = 0;
    T_sensors_min = 0;
    T_antenna_min = -100;
    T_SA_min = -150;
    T_tank_min = 15;
    sigma = 5.67051*10^-8;
    S = 1367;
    

    if Controller == 1
        T_RW = 50;
        T_RW_min = -10;
    elseif Controller == 2
        T_RW = 40;
        T_RW_min = 15;
    end
        
        
% Surface finish
        tsat_trans = 3*10^-2;
        tsat_rec = 3*10^-2;
        t_surfacefinish = 1;
        
        
    % Solar Array
    if a_e_SA == 1 % 5 mil Aluminized Teflon 
        alpha_eps_SA = 0.12;
        ro_SA = 0.27;
        Ap_SA = sigma*(T_SA+273)^4*Array_size/(S*alpha_eps_SA);
        M_thermalfinish_SA = ro_SA*Ap_SA*t_surfacefinish;
        Cost_thermalfinish_SA = 10*M_thermalfinish_SA;
    elseif a_e_SA == 2 % Kapton
        alpha_eps_SA = 0.56;
        ro_SA = 0.19;
        Ap_SA = sigma*(T_SA+273)^4*Array_size/(S*alpha_eps_SA);
        M_thermalfinish_SA = ro_SA*Ap_SA*t_surfacefinish;
        Cost_thermalfinish_SA =50*M_thermalfinish_SA;
    elseif a_e_SA == 3 % Al coated black kapton
        alpha_eps_SA = 0.275;
        ro_SA = 0.095;
        Ap_SA = sigma*(T_SA+273)^4*Array_size/(S*alpha_eps_SA);
        M_thermalfinish_SA = ro_SA*Ap_SA*t_surfacefinish;
        Cost_thermalfinish_SA = 30*M_thermalfinish_SA;
    elseif a_e_SA == 4 % Beta cloth
        alpha_eps_SA = 0.37;
        ro_SA = 0.237;
        Ap_SA = sigma*(T_SA+273)^4*Array_size/(S*alpha_eps_SA);
        M_thermalfinish_SA = ro_SA*Ap_SA*t_surfacefinish;
        Cost_thermalfinish_SA = 40*M_thermalfinish_SA;
    end
        
    % Antenna
        % Transmitting antenna
        if a_e_trans_antenna == 1 % 5 mil Aluminized Teflon 
            alpha_eps_trans_antenna = 0.12;
            ro_trans_antenna = 0.27;
            A_antenna_trans = 2*pi*(Dsat_trans/2)^2 + 2*pi*(Dsat_trans/2)*tsat_trans;
            Ap_antenna_trans = sigma*(T_antenna+273)^4*A_antenna_trans/(S*alpha_eps_trans_antenna);
            M_thermalfinish_antenna_trans = ro_trans_antenna*Ap_antenna_trans*t_surfacefinish;
            Cost_thermalfinish_trans_antenna = 10*M_thermalfinish_antenna_trans;
            elseif a_e_trans_antenna == 2 % Kapton
            alpha_eps_trans_antenna = 0.56;
            ro_trans_antenna = 0.19;
            A_antenna_trans = 2*pi*(Dsat_trans/2)^2 + 2*pi*(Dsat_trans/2)*tsat_trans;
            Ap_antenna_trans = sigma*(T_antenna+273)^4*A_antenna_trans/(S*alpha_eps_trans_antenna);
            M_thermalfinish_antenna_trans = ro_trans_antenna*Ap_antenna_trans*t_surfacefinish;
            Cost_thermalfinish_trans_antenna = 50*M_thermalfinish_antenna_trans;
            elseif a_e_trans_antenna == 3 % Al coated black kapton
            alpha_eps_trans_antenna = 0.275;
            ro_trans_antenna = 0.095;
            A_antenna_trans = 2*pi*(Dsat_trans/2)^2 + 2*pi*(Dsat_trans/2)*tsat_trans;
            Ap_antenna_trans = sigma*(T_antenna+273)^4*A_antenna_trans/(S*alpha_eps_trans_antenna);
            M_thermalfinish_antenna_trans = ro_trans_antenna*Ap_antenna_trans*t_surfacefinish;
            Cost_thermalfinish_trans_antenna = 30*M_thermalfinish_antenna_trans;
            elseif a_e_trans_antenna == 4 % Beta cloth
            alpha_eps_trans_antenna = 0.37;
            ro_trans_antenna = 0.237;
            A_antenna_trans = 2*pi*(Dsat_trans/2)^2 + 2*pi*(Dsat_trans/2)*tsat_trans;
            Ap_antenna_trans = sigma*(T_antenna+273)^4*A_antenna_trans/(S*alpha_eps_trans_antenna);
            M_thermalfinish_antenna_trans = ro_trans_antenna*Ap_antenna_trans*t_surfacefinish;
            Cost_thermalfinish_trans_antenna = 40*M_thermalfinish_antenna_trans;
        end
        
        % Receiving antenna
        if a_e_rec_antenna == 1 % 5 mil Aluminized Teflon 
            alpha_eps_rec_antenna = 0.12;
            ro_rec_antenna = 0.27;
            A_antenna_rec = 2*pi*(Dsat_rec/2)^2 + 2*pi*(Dsat_rec/2)*tsat_trans;
            Ap_antenna_rec = sigma*(T_antenna+273)^4*A_antenna_rec/(S*alpha_eps_rec_antenna);
            M_thermalfinish_antenna_rec = ro_rec_antenna*Ap_antenna_rec*t_surfacefinish;
            Cost_thermalfinish_rec_antenna = 10*M_thermalfinish_antenna_rec;
            elseif a_e_rec_antenna == 2 % Kapton
            alpha_eps_rec_antenna = 0.56;
            ro_rec_antenna = 0.19;
            A_antenna_rec = 2*pi*(Dsat_rec/2)^2 + 2*pi*(Dsat_rec/2)*tsat_trans;
            Ap_antenna_rec = sigma*(T_antenna+273)^4*A_antenna_rec/(S*alpha_eps_rec_antenna);
            M_thermalfinish_antenna_rec = ro_rec_antenna*Ap_antenna_rec*t_surfacefinish;
            Cost_thermalfinish_rec_antenna = 50*M_thermalfinish_antenna_rec;
            elseif a_e_rec_antenna == 3 % Al coated black kapton
            alpha_eps_rec_antenna = 0.275;
            ro_rec_antenna = 0.095;
            A_antenna_rec = 2*pi*(Dsat_rec/2)^2 + 2*pi*(Dsat_rec/2)*tsat_trans;
            Ap_antenna_rec = sigma*(T_antenna+273)^4*A_antenna_rec/(S*alpha_eps_rec_antenna);
            M_thermalfinish_antenna_rec = ro_rec_antenna*Ap_antenna_rec*t_surfacefinish;
            Cost_thermalfinish_rec_antenna = 30*M_thermalfinish_antenna_rec;
            elseif a_e_rec_antenna == 4 % Beta cloth
            alpha_eps_rec_antenna = 0.37;
            ro_rec_antenna = 0.237;
            A_antenna_rec = 2*pi*(Dsat_rec/2)^2 + 2*pi*(Dsat_rec/2)*tsat_trans;
            Ap_antenna_rec = sigma*(T_antenna+273)^4*A_antenna_rec/(S*alpha_eps_rec_antenna);
            M_thermalfinish_antenna_rec = ro_rec_antenna*Ap_antenna_rec*t_surfacefinish;
            Cost_thermalfinish_rec_antenna = 40*M_thermalfinish_antenna_rec;
        end

    
    % Spacecraft bus
        if bus_config == 1 % cylindrical bus
        if a_e_bus == 1 % 5 mil Aluminized Teflon 
            alpha_eps_bus = 0.12;
            ro_bus = 0.27;
            A_bus =  2*pi*r_structures^2 + 2*pi*r_structures*L_structures;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 10*M_thermalfinish_bus;

        elseif a_e_bus == 2 % Kapton
            alpha_eps_bus = 0.56;
            ro_bus = 0.19;
            A_bus =  2*pi*r_structures^2 + 2*pi*r_structures*L_structures;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 50*M_thermalfinish_bus;

        elseif a_e_bus == 3 % Al coated black kapton
            alpha_eps_bus = 0.275;
            ro_bus = 0.095;
            A_bus =  2*pi*r_structures^2 + 2*pi*r_structures*L_structures;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 30*M_thermalfinish_bus;
        elseif a_e_bus == 4 % Beta cloth
            alpha_eps_bus = 0.37;
            ro_bus = 0.237;
            A_bus =  2*pi*r_structures^2 + 2*pi*r_structures*L_structures;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 40*M_thermalfinish_bus;
        end
        
    elseif bus_config == 2 % rectangular bus
         if a_e_bus == 1 % 5 mil Aluminized Teflon 
            alpha_eps_bus = 0.12;
            ro_bus = 0.27;
            A_bus =  2*ws^2 + 4*hs*ws;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 10*M_thermalfinish_bus;

        elseif a_e_bus == 2 % Kapton
            alpha_eps_bus = 0.56;
            ro_bus = 0.19;
            A_bus =  2*ws^2 + 4*hs*ws;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 50*M_thermalfinish_bus;

        elseif a_e_bus == 3 % Al coated black kapton
            alpha_eps_bus = 0.275;
            ro_bus = 0.095;
            A_bus =  2*ws^2 + 4*hs*ws;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 30*M_thermalfinish_bus;
        elseif a_e_bus == 4 % Beta cloth
            alpha_eps_bus = 0.37;
            ro_bus = 0.237;
            A_bus =  2*ws^2 + 4*hs*ws;
            Ap_bus = sigma*(T_bus+273)^4*A_bus/(S*alpha_eps_bus);
            M_thermalfinish_bus = ro_bus*Ap_bus*t_surfacefinish;
            Cost_thermalfinish_bus = 40*M_thermalfinish_bus;
        end
        end
    
 M_thermalfinish = M_thermalfinish_SA + M_thermalfinish_antenna_trans + M_thermalfinish_antenna_rec + M_thermalfinish_bus;   
 Cost_thermalfinish = Cost_thermalfinish_SA + Cost_thermalfinish_trans_antenna + Cost_thermalfinish_rec_antenna + Cost_thermalfinish_bus;
 

Thermaloutput_SSL2_SS1 = [M_thermalfinish Cost_thermalfinish];
end