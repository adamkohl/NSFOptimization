clc
clear all
format longEng
tic;
  
designParam1 =  [ 95e+009    80e+009    61.0000000000000e+000    6e+000   850e+000    200e-003...
                200e-003    13e+000    3e+000    302e+000    98e+000    40e+000...
                105e+000    38e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
                3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];

designParam2 =  [ 95.05e+009    80.05e+009    61.0000000000000e+000    6.2e+000   851e+000    202e-003...
                202e-003    13.05e+000    3.05e+000    303e+000    99e+000    40.4e+000...
                105.5e+000    38.4e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
                3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];


designParam3 =  [ 94.05e+009    79.05e+009    61.0000000000000e+000    5.98e+000   849e+000    198e-003...
                198e-003    12.05e+000    2.95e+000    300e+000    97e+000    39.6e+000...
                103e+000    37e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
                3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];


designParam4 =  [ 95.005e+009    80.005e+009    61.0000000000000e+000    6.005e+000   850.5e+000    200e-003...
                200e-003    13e+000    3e+000    302e+000    98e+000    40e+000...
                105e+000    38e+000    2.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000...
                2.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000...
                3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000];

designParameters = [designParam1;designParam2;designParam3;designParam4];

%Preallocate memory
V = zeros(1:size(designParameters));
no_samples = 1000;
UDsat_trans = zeros(1,no_samples);
UDsat_rec = zeros(1,no_samples);
UDground_trans = zeros(1,no_samples);
UDground_rec = zeros(1,no_samples);
USat_long = zeros(1,no_samples);
UGround_long = zeros(1,no_samples);
UGround_lat = zeros(1,no_samples);
UGround_long_r = zeros(1,no_samples);
UGround_lat_r = zeros(1,no_samples);
UPst = zeros(1,no_samples);
UPgt = zeros(1,no_samples);
Uf = zeros(1,no_samples);
Ufup = zeros(1,no_samples);

%Preallocating graph information
color_index = 1;
numlines = 10;
Legend = cell(numlines,1);
for iter=1:numlines
    Legend{iter}=strcat('Iteration', num2str(iter),'*100');
end

for j =1:size(designParameters)

    currentDesign = designParameters(j,:);
    operational_lifetime = 10;
    f = currentDesign(1);
    fup = currentDesign(2);
    N = currentDesign(3);
    Pst = currentDesign(4);
    Pgt = currentDesign(5);
    Dsat_trans = currentDesign(6);
    Dsat_rec = currentDesign(7);
    Dground_rec = currentDesign(8);
    Dground_trans = currentDesign(9);
    Sat_long = currentDesign(10);
    Ground_long = currentDesign(11);
    Ground_lat = currentDesign(12);
    Ground_long_r = currentDesign(13);
    Ground_lat_r = currentDesign(14);
    Amp = currentDesign(15);
    Prop_tech = currentDesign(16);
    Prop = currentDesign(17);
    Batt = currentDesign(18);
    SA_material = currentDesign(19);
    a_e_SA = currentDesign(20);
    a_e_trans_antenna = currentDesign(21);
    a_e_rec_antenna = currentDesign(22);
    a_e_bus = currentDesign(23);
    eps_rad_battery = currentDesign(24);
    eps_rad_RW = currentDesign(25);
    eps_rad_tank = currentDesign(26);
    bus_config = currentDesign(27);
    bus_material = currentDesign(28);
    Prop_tank_material = currentDesign(29);
    launchsite = currentDesign(30);
    Launch_vehicle = currentDesign(31);
    Controller = currentDesign(32);
    Ant_type = currentDesign(33);
    Ant_type_ground = currentDesign(34);
    Power = currentDesign(35);
    Thermal = currentDesign(36);
    h = 3.5786000*10^7;
    V(j) = -satellite_objective(currentDesign);

    if Dsat_trans <= .15
        q1 =0.0001;
    elseif Dsat_trans >.15 && Dsat_trans <= 5
        q1 = 0.0412165* Dsat_trans - 0.00608247;
    end

    if Dsat_rec <= .15
        q2 =0.0001;
    elseif Dsat_rec >.15 && Dsat_rec <= 5
        q2 = 0.0412165* Dsat_rec - 0.00608247;
    end

    if Dground_trans <= 2.5
        q3 = 0.01;
    elseif Dground_trans > 2.5 && Dground_trans <= 20
        q3 = 0.0108571 * Dground_trans - 0.0171429;
    end

    if Dground_rec <= 2.5
        q4 = 0.01;
    elseif Dground_rec > 2.5 && Dground_rec <= 20
        q4 = 0.0108571 * Dground_rec - 0.0171429;
    end

    q5 = .1;
    q6 = .01;
    q7 = .01;
    q8 = .01;
    q9 = .01;

    if Pst <= 5.5
        q10 = 0.1;
    elseif Pst > 5.5 && Pst <= 300
        q10 = 0.00305603*Pst +0.0831919;
    end

    if Pgt <= 305    
        q11 = 1;
    elseif Pgt > 305 && Pgt <= 1000
        q11 =((4*Pgt)/695)-(105/139);
    end
    
    pd1_lower = Dsat_trans-q1;
    pd1_upper = Dsat_trans+q1;
    pd1 = makedist('Tri',pd1_lower,Dsat_trans,pd1_upper);
    pd1n = normpdf(pd1_lower:.01:pd1_upper,mean(pd1),std(pd1));
    
    p2_lower = Dsat_rec-q2;
    p2_upper = Dsat_rec+q2;
    pd2 = makedist('Tri',pd1_lower,Dsat_rec,pd2_upper);
    pd2n = normpdf(pd2_lower:.01:pd2_upper,mean(pd2),std(pd2));
    
    p3_lower = Dground_trans-q3;
    p3_upper = Dground_trans+q3;
    pd3 = makedist('Tri',pd1_lower,Dground_trans,pd3_upper);
    pd3n = normpdf(pd3_lower:.01:pd3_upper,mean(pd3),std(pd3));
    
    p4_lower = Dground_rec-q4;
    p4_upper = Dground_rec+q4;
    pd4 = makedist('Tri',pd1_lower,Dground_rec,pd4_upper);
    pd4n = normpdf(pd4_lower:.01:pd4_upper,mean(pd4),std(pd4));
    
    p5_lower = Sat_long-q5;
    p5_upper = Sat_long+q5;
    pd5 = makedist('Tri',pd1_lower,Sat_long,pd5_upper);
    pd5n = normpdf(pd5_lower:.01:pd5_upper,mean(pd5),std(pd5));
    
    p6_lower = Ground_long-q6;
    p6_upper = Ground_long+q6;
    pd6 = makedist('Tri',pd1_lower,Ground_long,pd6_upper);
    pd6n = normpdf(pd6_lower:.01:pd6_upper,mean(pd6),std(pd6));
    
    p7_lower = Ground_lat-q7;
    p7_upper = Ground_lat+q7;
    pd7 = makedist('Tri',pd1_lower,Ground_lat,pd7_upper);
    pd7n = normpdf(pd7_lower:.01:pd7_upper,mean(pd7),std(pd7));
    
    p8_lower = Ground_long_r-q8;
    p8_upper = Ground_long_r+q8;
    pd8 = makedist('Tri',pd1_lower,Ground_long_r,pd8_upper);
    pd8n = normpdf(pd8_lower:.01:pd8_upper,mean(pd8),std(pd8));
    
    p9_lower = Ground_lat_r-q9;
    p9_upper = Ground_lat_r+q9;
    pd9 = makedist('Tri',pd1_lower,Ground_lat_r,pd9_upper);
    pd9n = normpdf(pd9_lower:.01:pd9_upper,mean(pd9),std(pd9));
    
    p10_lower = Pst-q10;
    p10_upper = Pst+q10;
    pd10 = makedist('Tri',pd1_lower,Pst,pd10_upper);
    pd10n = normpdf(pd10_lower:.01:pd10_upper,mean(pd10),std(pd10));
    
    p11_lower = Pgt-q11;
    p11_upper = Pgt+q11;
    pd11 = makedist('Tri',pd1_lower,Pgt,pd11_upper);
    pd11n = normpdf(pd11_lower:.01:pd1_upper,mean(pd1),std(pd1));
    
    p12_lower = f-10^2;
    p12_upper = f+10^3;
    pd12 = makedist('Tri',pd1_lower,f,pd12_upper);
    pd12n = normpdf(pd12_lower:2.5:pd1_upper,mean(pd12),std(pd12));
    
    p13_lower = fup-10^2;
    p13_upper = fup+10^3;
    pd13 = makedist('Tri',pd1_lower,fup,pd13_upper);
    pd13n = normpdf(pd1_lower:2.5:pd1_upper,mean(pd13),std(pd13));

    figure(j)
    subplot(4,4,1)
    title(sprintf('Dsat trans,Design %i', j))
    plot(pd1n,'color',CM(color_index,:))
    hold on

    subplot(4,4,2) 
    title(sprintf('Dsat rec,Design %i', j))
    plot(pd2n,'color',CM(color_index,:))
    hold on

    subplot(4,4,3)
    title(sprintf('Dground trans,Design %i', j))
    plot(pd3n,'color',CM(color_index,:))
    hold on

    subplot(4,4,4)
    title(sprintf('Dground rec,Design %i', j))
    plot(pd4n,'color',CM(color_index,:))
    hold on

    subplot(4,4,5)
    title(sprintf('Sat long,Design %i', j))
    plot(pd5n,'color',CM(color_index,:))
    hold on

    subplot(4,4,6)
    title(sprintf('Ground long,Design %i', j))
    plot(pd6n,'color',CM(color_index,:))
    hold on

    subplot(4,4,7)
    title(sprintf('Ground lat,Design %i', j))
    plot(pd7n,'color',CM(color_index,:))
    hold on

    subplot(4,4,8)
    title(sprintf('Ground long r,Design %i', j))
    plot(pd8n,'color',CM(color_index,:))
    hold on

    subplot(4,4,9)
    title(sprintf('Ground lat r,Design %i', j))
    plot(pd9n,'color',CM(color_index,:))
    hold on

    subplot(4,4,10)
    title(sprintf('Pst,Design %i', j))
    plot(pd10n,'color',CM(color_index,:))
    hold on

    subplot(4,4,11)
    title(sprintf('Pgt,Design %i', j))
    plot(pd11n,'color',CM(color_index,:))
    hold on

    subplot(4,4,12)
    title(sprintf('f,Design %i', j))
    plot(pd12n,'color',CM(color_index,:))
    hold on

    subplot(4,4,13)
    title(sprintf('fup,Design %i', j))
    plot(pd13n,'color',CM(color_index,:))

    legend(Legend);
    hold on

    color_index = color_index+1;
    hold off

    %for better pdfs, increase this loop to 100,000
    for i = 1:no_samples

        UDsat_trans(i) = datasample(pd1n,1);
        UDsat_rec(i) = datasample(pd2n,1);
        UDground_trans(i) = datasample(pd3n,1);
        UDground_rec(i) = datasample(pd4n,1);
        USat_long(i) = datasample(pd5n,1);
        UGround_long(i) = datasample(pd6n,1);
        UGround_lat(i) = datasample(pd7n,1);
        UGround_long_r(i) = datasample(pd8n,1);
        UGround_lat_r(i) = datasample(pd9n,1);
        UPst(i) = datasample(pd10n,1);
        UPgt(i) = datasample(pd11n,1);
        Uf(i) = datasample(pd12n,1);
        Ufup(i) = datasample(pd13n,1);

        currentDesign(8) = UDground_rec(i);
        currentDesign(9) = UDground_trans(i);
        currentDesign(7) = UDsat_rec(i);
        currentDesign(6) = UDsat_trans(i);
        currentDesign(12) = UGround_lat(i);
        currentDesign(14) = UGround_lat_r(i);
        currentDesign(11) = UGround_long(i);
        currentDesign(13) = UGround_long_r(i);
        currentDesign(5) = UPgt(i);
        currentDesign(4) = UPst(i);
        currentDesign(10) = USat_long(i);
        currentDesign(1) = Uf(i);
        currentDesign(2) = Ufup(i);

        [y(i),P(i),S(i)] = satellite_objective(currentDesign);
        y(i)=-y(i);
        c = y(i);
        a = -.00000009;
        U(i) = 1E-232+(-1/a)*(exp(-a*c));
    end
linespec = {'b','m','c','r','g',[1 .6 0],'k'};
hold on
figure(i*size(designParameters)+1);
M(j)=mean(y);
[n,xout] = hist(y,no_samples);
x5(j) = quantile(y,.05);
plot(xout,(n*100)/trapz(xout,n),'color',linespec{j},'LineWidth',1.4);
hold off

Util(j)=mean(U);
u5(j) = quantile(U,.05);

[n7,xout7] = hist(U,1000);
Exp(j) = sum(xout7.*n7)/length(U);
end
Exp

[C1,I1] = max(Exp);
Design = [I1]
    
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

% for i=1:4
% [r(i),p(i)]=corrcoef(Exp1_ro(i),Exp2_ro(i),'type','Spearman');   
% end
%  r
%  p
