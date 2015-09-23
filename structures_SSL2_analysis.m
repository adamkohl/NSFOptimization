function Structures_SSL2_io = structures_SSL2_analysis(bus_material)


Structuresout_SSL2_SS1 = structures_SSL2_SS1(bus_material);
    ro_bus = Structuresout_SSL2_SS1(1);
    E = Structuresout_SSL2_SS1(2);
    F_tu = Structuresout_SSL2_SS1(3);
    F_ty = Structuresout_SSL2_SS1(4);
    FOS_ulti = Structuresout_SSL2_SS1(5);
    FOS_yield = Structuresout_SSL2_SS1(6);
    Cost_bus_per_kg = Structuresout_SSL2_SS1(7);


Structures_SSL2_io = [ro_bus E F_tu F_ty FOS_ulti FOS_yield Cost_bus_per_kg];
end

