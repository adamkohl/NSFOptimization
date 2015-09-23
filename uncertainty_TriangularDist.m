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
    CM = jet(10);    
    y_NoUtils(i) = -satellite_objective(designParameters(i,:));
    
    %Preallocating graph information
    color_index = 1;
    numlines = 10;
    Legend = cell(numlines,1);
    for iter=1:numlines
        Legend{iter}=strcat('Iteration', num2str(iter),'*100');
    end
    
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
        
        pd1_l = Dsat_trans-0.75*r1;
        pd1_u = Dsat_trans+0.75*r1;
        pd1 = makedist('Tri',pd1_l,Dsat_trans,pd1_u);
         UDsat_trans(j) = random(pd1,1);
        
        pd2_l = Dsat_rec-0.75*r2;
        pd2_u = Dsat_rec+0.75*r2;
        pd2 = makedist('Tri',pd2_l,Dsat_rec,pd2_u);
         UDsat_rec(j) = random(pd2,1);
        
        pd3_l = Dground_trans-0.75*r3;
        pd3_u = Dground_trans+0.75*r3;
        pd3 = makedist('Tri',pd3_l,Dground_trans,pd3_u);
         UDground_trans(j) = random(pd3,1);
        
        pd4_l = Dground_rec-0.75*r4;
        pd4_u = Dground_rec+0.75*r4;
        pd4 = makedist('Tri',pd4_l,Dground_rec,pd4_u);
         UDground_rec(j) = random(pd4,1);
        
        pd5_l = Sat_long-0.75*r5;
        pd5_u = Sat_long+0.75*r5;
        pd5 = makedist('Tri',pd5_l,Sat_long,pd5_u);
         USat_long(j) = random(pd5,1);
        
        pd6_l = Ground_long-0.75*r6;
        pd6_u = Ground_long+0.75*r6;
        pd6 = makedist('Tri',pd6_l,Ground_long,pd6_u);
         UGround_long(j) = random(pd6,1);
        
        pd7_l = Ground_lat-0.75*r7;
        pd7_u = Ground_lat+0.75*r7;
        pd7 = makedist('Tri',pd7_l,Ground_lat,pd7_u);
         UGround_lat(j) = random(pd7,1);
        
        pd8_l = Ground_long_r-0.75*r8;
        pd8_u = Ground_long_r+0.75*r8;
        pd8 = makedist('Tri',pd8_l,Ground_long_r,pd8_u);
         UGround_long_r(j) = random(pd8,1); 
        
        pd9_l = Ground_lat_r-0.75*r9;
        pd9_u = Ground_lat_r+0.75*r9;
        pd9 = makedist('Tri',pd9_l,Ground_lat_r,pd9_u);
         UGround_lat_r(j) = random(pd9,1); 
        
        pd10_l = Pst-0.5*r10;
        pd10_u = Pst+0.75*r10;
        pd10 = makedist('Tri',pd10_l,Pst,pd10_u);
         UPst(j) = random(pd10,1);
        
        pd11_l = Pgt-0.5*r11;
        pd11_u = Pgt+0.75*r11;
        pd11 = makedist('Tri',pd11_l,Pgt,pd11_u);
         UPgt(j) = random(pd11,1); 
        
        pd12_l = f-10^4*r12;
        pd12_u = f+10^4*r12;
        pd12 = makedist('Tri',pd12_l,f,pd12_u);
         Uf(j) = random(pd12,1); 
        
        pd13_l = fup-10^4*r13;
        pd13_u = fup+10^4*r13;
        pd13 = makedist('Tri',pd13_l,fup,pd13_u);
         Ufup(j) = random(pd13,1); 
        
        %Compute the pdfs 
        pd1f = pdf(pd1,pd1_l:.01:pd1_u);
        pd2f = pdf(pd2,pd2_l:.01:pd2_u);
        pd3f = pdf(pd3,pd3_l:.01:pd3_u);
        pd4f = pdf(pd4,pd4_l:.01:pd4_u);
        pd5f = pdf(pd5,pd5_l:.01:pd5_u);
        pd6f = pdf(pd6,pd6_l:.01:pd6_u);
        pd7f = pdf(pd7,pd7_l:.01:pd7_u);
        pd8f = pdf(pd8,pd8_l:.01:pd8_u);
        pd9f = pdf(pd9,pd9_l:.01:pd9_u);
        pd10f = pdf(pd10,pd10_l:.01:pd10_u);
        pd11f = pdf(pd11,pd11_l:.01:pd11_u);
        pd12f = pdf(pd12,pd12_l:2.5:pd12_u);
        pd13f = pdf(pd13,pd13_l:2.5:pd13_u);
        
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
        %This was done to avoid complex utility numbers
        y(j) = -y(j);
        
        U1(j) = y(j).^(1/8);
        U2(j) = y(j).^(1/8);
        U3(j) = y(j).^(1/8); 
        U4(j) = y(j).^(1/8);
    
        if mod(j,100)
            continue
        end
        figure(i)
        subplot(4,4,1)
        title('Triangular 1')
        plot(pd1f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,2) 
        title('Triangular 2')
        plot(pd2f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,3)
        title('Triangular 3')
        plot(pd3f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,4)
        title('Triangular 4')
        plot(pd4f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,5)
        title('Triangular 5')
        plot(pd5f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,6)
        title('Triangular 6')
        plot(pd6f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,7)
        title('Triangular 7')
        plot(pd7f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,8)
        title('Triangular 8')
        plot(pd8f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,9)
        title('Triangular 9')
        plot(pd9f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,10)
        title('Triangular 10')
        plot(pd10f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,11)
        title('Triangular 11')
        plot(pd11f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,12)
        title('Triangular 12')
        plot(pd12f,'color',CM(color_index,:))
        hold on
        
        subplot(4,4,13)
        title('Triangular 13')
        plot(pd13f,'color',CM(color_index,:))
        
        legend(Legend);
        hold on
        
        color_index = color_index+1;
    end
    
    color_index = 0;
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
toc;

% C values are the magnitude while I values are the ranking
Design = [I1;I2;I3;I4];
Designs = {'Design 1';'Design 2';'Design 3';'Design 4'};
value_NoUtils = M;
outputTable = table(value_NoUtils',expUtilOutcome1',Exp1_ro',expUtilOutcome2',Exp2_ro',...
    expUtilOutcome3',Exp3_ro',expUtilOutcome4',Exp4_ro','RowNames',Designs,...
    'VariableNames',{'ValueNoUtilities' 'expUtilOutcome1' 'Exp1_ro' 'expUtilOutcome2'...
    'Exp2_ro' 'expUtilOutcome3' 'Exp3_ro' 'expUtilOutcome4' 'Exp4_ro'})
