%% Structures SSL2 SS1 (Bus)
function Structuresout_SSL2_SS1 = structures_SSL2_SS1(bus_material)

% Material properties
if  bus_material == 1 % Aluminum 
    ro_bus = 2850;
    E = 72*10^9;
    F_tu = 420*10^6;
    F_ty = 320*10^6;
    FOS_ulti =1.6;
    FOS_yield = 1.4;
    Cost_bus_per_kg = 20;

elseif  bus_material == 2 % Steel
        ro_bus = 7860;
        E = 196*10^9;
        F_tu = 860*10^6;
        F_ty = 620*10^6;
        FOS_ulti =1.6;
        FOS_yield = 1.4;
        Cost_bus_per_kg = 10;
        
elseif bus_material == 3 %  Magnesium 
        ro_bus = 1770;
        E = 45*10^9;
        F_tu = 270*10^6;
        F_ty = 165*10^6;
        FOS_ulti =1.6;
        FOS_yield = 1.4;
        Cost_bus_per_kg = 40;
elseif bus_material == 4 % Titanium
       ro_bus = 4430;
        E = 110*10^9;
        F_tu = 900*10^6;
        F_ty = 855*10^6;
        FOS_ulti =1.6;
        FOS_yield = 1.4; 
        Cost_bus_per_kg = 100;
end

Structuresout_SSL2_SS1 = [ro_bus E F_tu F_ty FOS_ulti FOS_yield Cost_bus_per_kg];
end