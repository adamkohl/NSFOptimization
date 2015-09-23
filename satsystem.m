%% System level
function Satsystemout = satsystem(N,Cost_payload,Cost_groundstation,Cost_propulsion,...
    Cost_power,Cost_ADCS,Cost_thermal,Cost_structures,Cost_lv,SNRdown,SNRup)

    % Composite Signal to Noise ration
        Eb_No_down = 10^(SNRdown/10);
        Eb_No_up = 10^(SNRup/10);
        Eb_No_composite = Eb_No_up*Eb_No_down/(1+Eb_No_up+Eb_No_down);
        Signal_Noise_dB = 10*log10(Eb_No_composite);

%% Revenue model
        SNR = Signal_Noise_dB;
        if SNR<=5
            SNR_multi = 0;
        elseif SNR>30
                SNR_multi = 1;
            else
                SNR_multi = SNR/30;
        end
        SNR_multi;

        N_onboard = N;

        N_leased = zeros(1,10);
        for i = 1:10
            if (N_onboard*(1-0.02)^i <= 50)
            N_leased(i) = N_onboard*(1-0.02)^i;
            else
                    N_leased(i) = 50;
            end
        end

        N_leased;

        Revenue = N_leased.*1.1*10^6*SNR_multi;

        Total_revenue = (Revenue(1)/(1+.1)^1) + (Revenue(2)/(1+.1)^2) ...
            + (Revenue(3)/(1+.1)^3) + (Revenue(4)/(1+.1)^4) + (Revenue(5)/(1+.1)^5) ...
            + (Revenue(6)/(1+.1)^6) + (Revenue(7)/(1+.1)^7) + (Revenue(8)/(1+.1)^8) ...
            + (Revenue(9)/(1+.1)^9) + (Revenue(10)/(1+.1)^10);

        
        
% Cost model    
    % Cost of Integration,test and assembly
        t_ground = 10*10^-2;
        Cost_integ_test_assembly = 989+0.215*(Cost_payload+Cost_power+Cost_thermal+Cost_ADCS+Cost_structures+Cost_propulsion+Cost_lv);

    % Cost of ground operations
        Cost_ground = 9.262*(Cost_payload+Cost_power+Cost_thermal+Cost_ADCS+Cost_structures+Cost_propulsion)^.642 ...
                    + Cost_groundstation;

    % Total cost        
        Total_cost = 1.308*(Cost_payload+Cost_power+Cost_thermal+Cost_ADCS+...
            Cost_structures+Cost_integ_test_assembly+Cost_ground+Cost_lv+Cost_propulsion);
        
% Value model
Net_present_profit = -Total_cost + (Revenue(1)/(1+.1)^1) + (Revenue(2)/(1+.1)^2) ...
    + (Revenue(3)/(1+.1)^3) + (Revenue(4)/(1+.1)^4) + (Revenue(5)/(1+.1)^5) ...
    + (Revenue(6)/(1+.1)^6) + (Revenue(7)/(1+.1)^7) + (Revenue(8)/(1+.1)^8) ...
    + (Revenue(9)/(1+.1)^9) + (Revenue(10)/(1+.1)^10);
        
        
Satsystemout = [Revenue Total_revenue Total_cost];
end