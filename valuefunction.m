%% Value
function Valueout = valuefunction(Total_cost,Revenue)

% Value model
Net_present_profit = -Total_cost + (Revenue(1)/(1+.1)^1) + (Revenue(2)/(1+.1)^2) ...
    + (Revenue(3)/(1+.1)^3) + (Revenue(4)/(1+.1)^4) + (Revenue(5)/(1+.1)^5) ...
    + (Revenue(6)/(1+.1)^6) + (Revenue(7)/(1+.1)^7) + (Revenue(8)/(1+.1)^8) ...
    + (Revenue(9)/(1+.1)^9) + (Revenue(10)/(1+.1)^10);   

Valueout = [Net_present_profit];
end