clc
clear all
format longEng
tic;

%% Initial design parameters 
N = 61;

designParam1 =[5e9   5e9   N   20  100   2,...
2  5   5   100  100   40,...
 75    40,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

designParam2 =[5.05e9   5.05e9   N  20.2  101   2.02,...
2.02  5.05   5.05   101  101   40.4,...
 75.75    40.4,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

designParam3 =[4.95e9   4.955e9   N   19.98  99   1.98,...
1.98  4.95   4.95   99  99   39.6,...
 74.25    39.6,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

designParam4 =[5.005e9   5.005e9   N  20  100   2,...
2  5   5   100  100   40,...
 75    40,...
 2.00000000000000e+000    2.00000000000000e+000,...
 3.00000000000000e+000    2.00000000000000e+000...
3.00000000000000e+000    2.00000000000000e+000,...
3.00000000000000e+000    3.00000000000000e+000,...
3.00000000000000e+000    2.00000000000000e+000...
2.00000000000000e+000    2.00000000000000e+000,...
2.00000000000000e+000    4.00000000000000e+000,...
1.00000000000000e+000    3.00000000000000e+000...
 3.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000,...
 1.00000000000000e+000    1.00000000000000e+000];

designParameters = [designParam1;designParam2;designParam3;designParam4];

%% Define Coefficients for utility functions
no_of_samples = 1000;
a = .00000009;

R1 = 10^7;
R2 = -10^7;
b1 = 135*10^6;

a1 = 0.00000009;
a2 = 0.00000001;
a3 = 0;
a4 = -0.000000005;
a5 = -0.00000009;

alpha = 5;
alpha1 = -0.01;
alpha2 = alpha1+0.1;
alpha3 = alpha2+0.1;
alpha4 = alpha3+0.1;

%% Pre-allocating memory
[sdp,~] = size(designParameters);

U1 = zeros(1,no_of_samples*sdp(1));
U2 = zeros(1,no_of_samples*sdp(1));
U3 = zeros(1,no_of_samples*sdp(1));
U4 = zeros(1,no_of_samples*sdp(1));

UDsat_trans = zeros(1,no_of_samples);
UDsat_rec = zeros(1,no_of_samples);
UDground_trans = zeros(1,no_of_samples);
UDground_rec = zeros(1,no_of_samples);
USat_long = zeros(1,no_of_samples);
UGround_long = zeros(1,no_of_samples);
UGround_lat = zeros(1,no_of_samples);
UGround_long_r = zeros(1,no_of_samples);
UGround_lat_r = zeros(1,no_of_samples);
UPst = zeros(1,no_of_samples);
UPgt = zeros(1,no_of_samples);
Uf = zeros(1,no_of_samples);
Ufup = zeros(1,no_of_samples);
y = zeros(1,no_of_samples);
y_NoUtils = zeros(1,no_of_samples);
M = zeros(1,sdp(1));
pdfStruct = struct();
expUtilOutcome1 = zeros(1,sdp);
expUtilOutcome2 = zeros(1,sdp);
expUtilOutcome3 = zeros(1,sdp);
expUtilOutcome4 = zeros(1,sdp);
Exp1_ro = zeros(1,sdp);
Exp1_I = zeros(1,sdp);
Exp2_ro = zeros(1,sdp);
Exp2_I = zeros(1,sdp);
Exp3_ro = zeros(1,sdp);
Exp3_I = zeros(1,sdp);
Exp4_ro = zeros(1,sdp);
Exp4_I = zeros(1,sdp);
C1 = zeros(1,sdp);
I1 = zeros(1,sdp);
C2 = zeros(1,sdp);
I2 = zeros(1,sdp);
C3 = zeros(1,sdp);
I3 = zeros(1,sdp);
C4 = zeros(1,sdp);
I4 = zeros(1,sdp);
z = 1;
tot_pd1 = zeros(10,111);
tot_pd2 = zeros(10,150);
tot_pd3 = zeros(10,76);
tot_pd4 = zeros(10,48);
tot_pd5 = zeros(10,143);
tot_pd6 = zeros(10,32);
tot_pd7 = zeros(10,70);
tot_pd8 = zeros(10,104);
tot_pd9 = zeros(10,62);
tot_pd10 = zeros(10,30);
tot_pd11 = zeros(10,51);
tot_pd12 = zeros(10,2018);
tot_pd13 = zeros(10,922);

%% The loop iterates through each design
for i=1:size(designParameters)
     
    operational_lifetime = 10;
    f = designParameters(i,1);
    fup = designParameters(i,2);
    N = designParameters(i,3);
    Pst = designParameters(i,4);
    Pgt = designParameters(i,5);
    Dsat_trans = designParameters(i,6);
    Dsat_rec = designParameters(i,7);
    Dground_rec = designParameters(i,8);
    Dground_trans = designParameters(i,9);
    Sat_long = designParameters(i,10);
    Ground_long = designParameters(i,11);
    Ground_lat = designParameters(i,12);
    Ground_long_r = designParameters(i,13);
    Ground_lat_r = designParameters(i,14);
    Amp = designParameters(i,15);
    Prop_tech = designParameters(i,16);
    Prop = designParameters(i,17);
    Batt = designParameters(i,18);
    SA_material = designParameters(i,19);
    a_e_SA = designParameters(i,20);
    a_e_trans_antenna = designParameters(i,21);
    a_e_rec_antenna = designParameters(i,22);
    a_e_bus = designParameters(i,23);
    eps_rad_battery = designParameters(i,24);
    eps_rad_RW = designParameters(i,25);
    eps_rad_tank = designParameters(i,26);
    bus_config = designParameters(i,27);
    bus_material = designParameters(i,28);
    Prop_tank_material = designParameters(i,29);
    launchsite = designParameters(i,30);
    Launch_vehicle = designParameters(i,31);
    Controller = designParameters(i,32);
    Ant_type = designParameters(i,33);
    Ant_type_ground = designParameters(i,34);
    Power = designParameters(i,35);
    Thermal = designParameters(i,36);
    h = 3.5786000*10^7;
    
    y_NoUtils(i) = -satellite_objective(designParameters(i,:));
    
    %% Determine utility values for each design parameter from normal pdf distribution
    for j = 1:no_of_samples
        
        r1 = rand(1);
        r2 = rand(1);
        r3 = rand(1);
        r4 = rand(1);
        r5 = rand(1);
        r6 = rand(1);
        r7 = rand(1);
        r8 = rand(1);
        r9 = rand(1);
        r10 = rand(1);
        r11 = rand(1);
        r12 = rand(1);
        r13 = rand(1);
       
        pd1 = makedist('Tri',Dsat_trans-0.75*r1,Dsat_trans,Dsat_trans+0.75*r1);
         UDsat_trans(j) = datasample(pd1,1);
        
        pd2 = makedist('Tri',Dsat_rec-0.75*r2,Dsat_rec,Dsat_rec+0.75*r2);
         UDsat_rec(j) = datasample(pd2,1);
        
        pd3 = makedist('Tri',Dground_trans-0.75*r3,Dground_trans,Dground_trans+0.75*r3);
         UDground_trans(j) = datasample(pd3,1);
        
        pd4 = makedist('Tri',Dground_rec-0.75*r4,Dground_rec,Dground_rec+0.75*r4);
         UDground_rec(j) = random(pd4,1);
        
        pd5 = makedist('Tri',Sat_long-0.75*r5,Sat_long,Sat_long+0.75*r5);
         USat_long(j) = random(pd5,1);
        
        pd6 = makedist('Tri',Ground_long-0.75*r6,Ground_long,Ground_long+0.75*r6);
         UGround_long(j) = random(pd6,1);
        
        pd7 = makedist('Tri',Ground_lat-0.75*r7,Ground_lat,Ground_lat+0.75*r7);
         UGround_lat(j) = random(pd7,1);
        
        pd8 = makedist('Tri',Ground_long_r-0.75*r8,Ground_long_r,Ground_long_r+0.75*r8);
         UGround_long_r(j) = random(pd8,1); 
        
        pd9 = makedist('Tri',Ground_lat_r-0.75*r9,Ground_lat_r,Ground_lat_r+0.75*r9);
         UGround_lat_r(j) = random(pd9,1); 
        
        pd10 = makedist('Tri',Pst-0.5*r10,Pst,Pst+0.75*r10);
        pd10n = normpdf([Pst-0.5*r10:0.01:Pst+0.75*r10],mean(pd10),std(pd10));
         UPst(j) = random(pd10,1);
        
        pd11 = makedist('Tri',Pgt-0.5*r11,Pgt,Pgt+0.75*r11);
         UPgt(j) = random(pd11,1); 
        
        pd12 = makedist('Tri',f-10^4*r12,f,f+10^4*r12);
         Uf(j) = random(pd12,1); 
        
        pd13 = makedist('Tri',fup-10^4*r13,fup,fup+10^4*r13);
         Ufup(j) = random(pd13,1); 

        designParameters(8) = UDground_rec(j);
        designParameters(9) = UDground_trans(j);
        designParameters(7) = UDsat_rec(j);
        designParameters(6) = UDsat_trans(j);
        designParameters(12) = UGround_lat(j);
        designParameters(14) = UGround_lat_r(j);
        designParameters(11) = UGround_long(j);
        designParameters(13) = UGround_long_r(j);
        designParameters(5) = UPgt(j);
        designParameters(4) = UPst(j);
        designParameters(10) = USat_long(j);
        designParameters(1) = Uf(j);
        designParameters(2) = Ufup(j);

        y(j) = -satellite_objective(designParameters(i,:));

        U1(j) = y(j).^(1/8);
        U2(j) = y(j).^(1/8);
        U3(j) = y(j).^(1/8); 
        U4(j) = y(j).^(1/8);
    
        if mod(j,100)
            continue
        end
%         axis auto
        figure(1)
        subplot(4,4,1)
        title('normal 1')
        plot(pd1n)
        hold on
        
        subplot(4,4,2) 
        title('normal 2')
        plot(pd2n)
        hold on
        
        subplot(4,4,3)
        title('normal 3')
        plot(pd3n)
        hold on
        
        subplot(4,4,4)
        title('normal 4')
        plot(pd4n)
        hold on
        
        subplot(4,4,5)
        title('normal 5')
        plot(pd5n)
        hold on
        
        subplot(4,4,6)
        title('normal 6')
        plot(pd6n)
        hold on
        
        subplot(4,4,7)
        title('normal 7')
        plot(pd7n)
        hold on
        
        subplot(4,4,8)
        title('normal 8')
        plot(pd8n)
        hold on
        
        subplot(4,4,9)
        title('normal 9')
        plot(pd9n)
        hold on
        
        subplot(4,4,10)
        title('normal 10')
        plot(pd10n)
        hold on
        
        subplot(4,4,11)
        title('normal 11')
        plot(pd11n)
        hold on
        
        subplot(4,4,12)
        title('normal 12')
        plot(pd12n)
        hold on
        
        subplot(4,4,13)
        title('normal 13')
        plot(pd13n)
        hold on
    end
    hold off
    M(i)=mean(y);
    
    [n1,xout1] = hist(U1,no_of_samples);
    expUtilOutcome1(i) = sum(xout1.*n1)/(length(U1));
    
    [n2,xout2] = hist(U2,no_of_samples);
    expUtilOutcome2(i) = sum(xout2.*n2)/(length(U2));
    
    [n3,xout3] = hist(U3,no_of_samples);
    expUtilOutcome3(i) = sum(xout3.*n3)/(length(U3));
    
    [n4,xout4] = hist(U4,no_of_samples);
    expUtilOutcome4(i) = sum(xout4.*n4)/(length(U4));
    
    % Utility_Exp_outcome 
    %Exp1_ro is the value, Exp1_I is the place holder
    [Exp1_ro(i),Exp1_I(i)]= sort(expUtilOutcome1(i),'descend');
    [Exp2_ro(i),Exp2_I(i)]= sort(expUtilOutcome2(i),'descend');
    [Exp3_ro(i),Exp3_I(i)]= sort(expUtilOutcome3(i),'descend');
    [Exp4_ro(i),Exp4_I(i)]= sort(expUtilOutcome4(i),'descend');

    [C1(i),I1(i)] = max(expUtilOutcome1(i));
    [C2(i),I2(i)] = max(expUtilOutcome2(i));
    [C3(i),I3(i)] = max(expUtilOutcome3(i));
    [C4(i),I4(i)] = max(expUtilOutcome4(i));
end

% C values are the magnitude while I values are the ranking
Design = [I1;I2;I3;I4];
toc;

fprintf('V              Exp1     Exp1_ro   Exp2    Exp2_ro    Exp3    Exp3_ro    Exp4    Exp4_ro     \n')
for i=1:4
fprintf('%g  %g  %g  %g  %g  %g  %g  %g  %g\n',y_NoUtils(i), expUtilOutcome1(i), Exp1_ro(i), expUtilOutcome2(i), Exp2_ro(i), expUtilOutcome3(i), Exp3_ro(i), expUtilOutcome4(i), Exp4_ro(i))   
end