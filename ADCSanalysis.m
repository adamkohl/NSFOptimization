function ADCS_io = ADCSanalysis(Controller,M_payload_t,M_payload_r,L_structures,r_structures,...
    hs,ws,Dsat_trans,Dsat_rec,Array_size,Ix_structures,Iy_structures,Iz_structures,bus_config,h,M_SA)

ADCSoutput_SSL1 = ADCS_SSL1(Controller,M_payload_t,M_payload_r,L_structures,r_structures,...
    hs,ws,Dsat_trans,Dsat_rec,Array_size,Ix_structures,Iy_structures,Iz_structures,bus_config,h,M_SA);
    
    Cost_ADCS = ADCSoutput_SSL1(1);
    M_ADCS = ADCSoutput_SSL1(2);
    P_ADCS = ADCSoutput_SSL1(3);
    M_RW = ADCSoutput_SSL1(4);
    V_RW = ADCSoutput_SSL1(5);
    
    ADCS_io = [Cost_ADCS M_ADCS P_ADCS M_RW V_RW];
end