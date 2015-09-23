%% Power system SSL2 SS1 (Power source - Solar Array)
function Poweroutput_SSL2_SS1 = power_SSL2_SS1(SA_material,Po)

% Required Solar Array power output
%     % Power required by all the subsystems
%         Po = P_payload + P_ADCS + P_Thermal;
        
        %  TE - Maximum eclpise time in hrs
        To = 24;
        TE = 1.2;
        TS = To - TE;
        t_SA = 10^-3;
        
        
        if  SA_material == 1 % Si
            degradation = 0.375;
            to = 60;    % Operating temperature of solar array in celsius
            tref = 28;  % Reference temperature in celsius
            temp_effect = (to - tref)*0.005;
            Solar_flux  = 1367; 
            cell_efficiency = 0.148;
            alpha = 23.5;   % Solar angle in degrees
            packing_factor = 0.9;
            H = 0.94;               
            h = 0.92;
            ro_SA_material = 2329;
            % Required solar array output
            P_SA = Po + Po*(TE/TS)*(1/(H*h));
            Cost_SA = 5*P_SA;
            
            Array_size = (P_SA/((1-degradation)*(1-temp_effect)))/...
            (Solar_flux*cosd(alpha)*cell_efficiency*packing_factor);
    
          M_SA = ro_SA_material*t_SA*Array_size;
%           M_SA = 0.04*P_SA;
          
        
        elseif  SA_material == 2 % GaAs
                degradation = 0.275;
                to = 60;    % Operating temperature of solar array in celsius
                tref = 28;  % Reference temperature in celsius
                temp_effect = (to - tref)*0.005;
                Solar_flux  = 1367; 
                cell_efficiency = 0.185;
                alpha = 23.5;   % Solar angle in degrees
                packing_factor = 0.9;
                H = 0.94;               
                h = 0.92;
                 ro_SA_material = 5317.6;
                % Required solar array output
                P_SA = Po + Po*(TE/TS)*(1/(H*h));
                
                Cost_SA = 20*P_SA;

                Array_size = (P_SA/((1-degradation)*(1-temp_effect)))/...
                (Solar_flux*cosd(alpha)*cell_efficiency*packing_factor);
           
             M_SA = ro_SA_material*t_SA*Array_size;
%              M_SA = 0.08*P_SA;
           
        elseif  SA_material == 3 % Multijunction
                degradation = 0.15;
                to = 60;    % Operating temperature of solar array in celsius
                tref = 28;  % Reference temperature in celsius
                temp_effect = (to - tref)*0.005;
                Solar_flux  = 1367; 
                cell_efficiency = 0.22;
                alpha = 23.5;   % Solar angle in degrees
                packing_factor = 0.9;
                H = 0.94;               
                h = 0.92;
                 ro_SA_material = (((4138+7310)/2)+(5317.6))/2;
                % Required solar array output
                P_SA = Po + Po*(TE/TS)*(1/(H*h));
                
                Cost_SA = 250*P_SA;

                Array_size = (P_SA/((1-degradation)*(1-temp_effect)))/...
                (Solar_flux*cosd(alpha)*cell_efficiency*packing_factor);
 
              M_SA = ro_SA_material*t_SA*Array_size;
%               M_SA = 0.1*P_SA;
           
        end  


Poweroutput_SSL2_SS1 = [Array_size M_SA Cost_SA];
end