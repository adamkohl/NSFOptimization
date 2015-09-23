%% Payload SSL2_SS1 (Satellite Transponders)
function Payloadoutput_SSL2_SS1 = payload_SSL2_SS1(Amp,Pst,N)

if Amp == 1 % SSA
   P_payload = N*(2.93*Pst + 12);  

   if Pst <= 10
       M_transponders = N*0.3;
   elseif Pst>10 && Pst<=35
       M_transponders = 0.5*N;
   elseif Pst>35 && Pst<60
       M_transponders = N*(.04*Pst+0.6);
   else
       M_transponders = N*(0.125*Pst+4.5);
   end

elseif Amp == 2 % TWTA
    M_transponders = N*(0.1111*Pst+0.88888);
    P_payload =  N*(.85*Pst + 12.5); 
end

% Volume of transponder (material assumed to be Aluminum)
    V_trans = M_transponders/2700;

Payloadoutput_SSL2_SS1 = [M_transponders P_payload V_trans];
end