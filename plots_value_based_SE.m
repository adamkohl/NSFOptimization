clear all
clc

        SNR = 10;
        if SNR<=5
            SNR_multi = 0;
        elseif SNR>30
                SNR_multi = 1;
            else
                SNR_multi = SNR/30;
        end
        SNR_multi;
        
for N_onboard = 1:100
    
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

        Total_revenue(N_onboard)= (Revenue(1)/(1+.1)^1) + (Revenue(2)/(1+.1)^2) ...
            + (Revenue(3)/(1+.1)^3) + (Revenue(4)/(1+.1)^4) + (Revenue(5)/(1+.1)^5) ...
            + (Revenue(6)/(1+.1)^6) + (Revenue(7)/(1+.1)^7) + (Revenue(8)/(1+.1)^8) ...
            + (Revenue(9)/(1+.1)^9) + (Revenue(10)/(1+.1)^10);
%         figure(1);
%         hold on;
%         plot(N_onboard,Total_revenue./10^6,'-b')
%         linespec = {'b','m','c','r','g',[1 .6 0],'k'};
%         plot(N_onboard,Total_revenue./10^6,'color',linespec{1},'LineWidth',1.4);
%         hold off;
end
figure(1);
hold on;
N_onboard = 1:100;
plot(N_onboard,Total_revenue./10^6,'-r')