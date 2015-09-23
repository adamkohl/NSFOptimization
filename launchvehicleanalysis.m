function Launchvehicle_io = launchvehicleanalysis(launchsite,Launch_vehicle,M_propulsion,M_thermal,...
    M_SA,Battery_mass,M_bus,M_ADCS,M_payload)

Launchvehicleoutput_SSL1 = launchvehicle_SSL1(launchsite,Launch_vehicle,M_propulsion,M_thermal,...
    M_SA,Battery_mass,M_bus,M_ADCS,M_payload);
    Cost_lv = Launchvehicleoutput_SSL1(1);

Launchvehicle_io = [Cost_lv];
end
