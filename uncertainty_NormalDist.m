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
[sdp,~] = size(designParameters);
V = zeros(1,sdp);
no_samples = 100;
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
M = zeros(sdp,no_samples);
y = zeros(sdp,no_samples);
P = zeros(sdp,no_samples);
S = zeros(sdp,no_samples);
n = zeros(sdp,no_samples);
xout = zeros(sdp,no_samples);
U = zeros(sdp,no_samples);

%Preallocating graph information
CM = jet(sdp);
color_index = 1;
numlines = sdp;
Legend = cell(numlines,1);
for iter=1:numlines
    Legend{iter}=strcat('Design ', num2str(iter));
end

for j =1:sdp

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
    d1 = (pd1_upper-pd1_lower)/100;
    dx1(j,:) = [pd1_lower:d1:pd1_upper];
    pd1 = makedist('Tri',pd1_lower,Dsat_trans,pd1_upper);
    pd1narray(j,:) = normpdf(dx1(j,:),mean(pd1),std(pd1));
    pd1n = makedist('Normal',mean(pd1),std(pd1));
    
    pd2_lower = Dsat_rec-q2;
    pd2_upper = Dsat_rec+q2;
    d2 = (pd2_upper-pd2_lower)/100;
    dx2(j,:) = [pd2_lower:d2:pd2_upper];
    pd2 = makedist('Tri',pd2_lower,Dsat_rec,pd2_upper);
    pd2narray(j,:) = normpdf(dx2(j,:),mean(pd2),std(pd2));
    pd2n = makedist('Normal',mean(pd2),std(pd2));
    
    pd3_lower = Dground_trans-q3;
    pd3_upper = Dground_trans+q3;
    d3 = (pd3_upper-pd3_lower)/100;
    dx3(j,:) = [pd3_lower:d3:pd3_upper];
    pd3 = makedist('Tri',pd3_lower,Dground_trans,pd3_upper);
    pd3narray(j,:) = normpdf(dx3(j,:),mean(pd3),std(pd3));
    pd3n = makedist('Normal',mean(pd3),std(pd3));
    
    pd4_lower = Dground_rec-q4;
    pd4_upper = Dground_rec+q4;
    d4 = (pd4_upper-pd4_lower)/100;
    dx4(j,:) = [pd4_lower:d4:pd4_upper];
    pd4 = makedist('Tri',pd4_lower,Dground_rec,pd4_upper);
    pd4narray(j,:) = normpdf(dx4(j,:),mean(pd4),std(pd4));
    pd4n = makedist('Normal',mean(pd4),std(pd4));
    
    pd5_lower = Sat_long-q5;
    pd5_upper = Sat_long+q5;
    d5 = (pd5_upper-pd5_lower)/100;
    dx5(j,:) = [pd5_lower:d5:pd5_upper];
    pd5 = makedist('Tri',pd5_lower,Sat_long,pd5_upper);
    pd5narray(j,:) = normpdf(dx5(j,:),mean(pd5),std(pd5));
    pd5n = makedist('Normal',mean(pd5),std(pd5));
    
    pd6_lower = Ground_long-q6;
    pd6_upper = Ground_long+q6;
    d6 = (pd6_upper-pd6_lower)/100;
    dx6(j,:) = [pd6_lower:d6:pd6_upper];
    pd6 = makedist('Tri',pd6_lower,Ground_long,pd6_upper);
    pd6narray(j,:) = normpdf(dx6(j,:),mean(pd6),std(pd6));
    pd6n = makedist('Normal',mean(pd6),std(pd6));
    
    pd7_lower = Ground_lat-q7;
    pd7_upper = Ground_lat+q7;
    d7 = (pd7_upper-pd7_lower)/100;
    dx7(j,:) = [pd7_lower:d7:pd7_upper];
    pd7 = makedist('Tri',pd7_lower,Ground_lat,pd7_upper);
    pd7narray(j,:) = normpdf(dx7(j,:),mean(pd7),std(pd7));
    pd7n = makedist('Normal',mean(pd7),std(pd7));
    
    pd8_lower = Ground_long_r-q8;
    pd8_upper = Ground_long_r+q8;
    d8 = (pd8_upper-pd8_lower)/100;
    dx8(j,:) = [pd8_lower:d8:pd8_upper];
    pd8 = makedist('Tri',pd8_lower,Ground_long_r,pd8_upper);
    pd8narray(j,:) = normpdf(dx8(j,:),mean(pd8),std(pd8));
    pd8n = makedist('Normal',mean(pd8),std(pd8));
    
    pd9_lower = Ground_lat_r-q9;
    pd9_upper = Ground_lat_r+q9;
    d9 = (pd9_upper-pd9_lower)/100;
    dx9(j,:) = [pd9_lower:d9:pd9_upper];
    pd9 = makedist('Tri',pd9_lower,Ground_lat_r,pd9_upper);
    pd9narray(j,:) = normpdf(dx9(j,:),mean(pd9),std(pd9));
    pd9n = makedist('Normal',mean(pd9),std(pd9));
    
    pd10_lower = Pst-q10;
    pd10_upper = Pst+q10;
    d10 = (pd10_upper-pd10_lower)/100;    
    dx10(j,:) = [pd10_lower:d10:pd10_upper];
    pd10 = makedist('Tri',pd10_lower,Pst,pd10_upper);
    pd10narray(j,:) = normpdf(dx10(j,:),mean(pd10),std(pd10));
    pd10n = makedist('Normal',mean(pd10),std(pd10));
    
    pd11_lower = Pgt-q11;
    pd11_upper = Pgt+q11;
    d11 = (pd11_upper-pd11_lower)/100;
    dx11(j,:) = [pd11_lower:d11:pd1_upper];
    pd11 = makedist('Tri',pd11_lower,Pgt,pd11_upper);
    pd11narray(j,:) = normpdf(dx11(j,:),mean(pd1),std(pd1));
    pd11n = makedist('Normal',mean(pd11),std(pd11));
    
    pd12_lower = f-10^2;
    pd12_upper = f+10^3;
    d12 = (pd12_upper-pd12_lower)/100;    
    dx12(j,:) = [pd12_lower:d12:pd1_upper];
    pd12 = makedist('Tri',pd12_lower,f,pd12_upper);
    pd12narray(j,:) = normpdf(dx12(j,:),mean(pd12),std(pd12));
    pd12n = makedist('Normal',mean(pd12),std(pd12));
    
    pd13_lower = fup-10^2;
    pd13_upper = fup+10^3;
    d13 = (pd13_upper-pd13_lower)/100;
    dx13(j,:) = [pd1_lower:d13:pd1_upper];
    pd13 = makedist('Tri',pd13_lower,fup,pd13_upper);
    pd13narray(j,:) = normpdf(dx13(j,:),mean(pd13),std(pd13));
    pd13n = makedist('Normal',mean(pd13),std(pd13));
    
    for i = 1:no_samples

        UDsat_trans(i) = random(pd1n,1);
        UDsat_rec(i) = random(pd2n,1);
        UDground_trans(i) = random(pd3n,1);
        UDground_rec(i) = random(pd4n,1);
        USat_long(i) = random(pd5n,1);
        UGround_long(i) = random(pd6n,1);
        UGround_lat(i) = random(pd7n,1);
        UGround_long_r(i) = random(pd8n,1);
        UGround_lat_r(i) = random(pd9n,1);
        UPst(i) = random(pd10n,1);
        UPgt(i) = random(pd11n,1);
        Uf(i) = random(pd12n,1);
        Ufup(i) = random(pd13n,1);

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
               
        [y(j,i),P(j,i),S(j,i)] = satellite_objective(currentDesign);
        y(j,i) = -y(j,i);
        c = y(i);%(y(i)-(2*10^8))/(10^8);
        a = -0.275e-5;
%         a = -.00000009;
        U(j,i) = 1E-232+(-1/a)*(exp(-a*c));
%         a = 0.2;
%         U(i) = (1/a)*c.^a;  
    end
    
    M(j)=mean(y(j,:));
    [n(j,:),xout(j,:)] = hist(y(j,:),no_samples);

%     linespec = {'b','m','c','r','g',[1 .6 0],'k'};
%     hold on
%     figure(i*sdp(1)+1);
%     dx5(j,:) = quantile(y(j,:),.05);
%     plot(xout(j,:),(n(j,:)*100)/trapz(xout(j,:),n(j,:)),'color',linespec{j},'LineWidth',1.4);
%     hold off
    
    UAvg(j)=mean(U(j,:));
%     u95(j,:) = quantile(U(j,:),.05);
    [n7(j,:),xout7(j,:)] = hist(U(j,:),no_samples);
    Exp(j) = sum(xout7(j,:).*n7(j,:))/length(U(j,:));
    
    % Utility_Exp_outcome 

end
toc;

[C1(j),I1(j)] = max(Exp(1));
[C2(j),I2(j)] = max(Exp(2));
[C3(j),I3(j)] = max(Exp(3));
[C4(j),I4(j)] = max(Exp(4));

% Design = [I1;I2;I3;I4];
% Designs = {'Design 1';'Design 2';'Design 3';'Design 4'};
% outputTable = table(V',expUtilOutcome',Exp', UAvg',...
%     'RowNames',Designs,...
%     'VariableNames',{'ValueNoUtilities' 'ExpectedUtility' '95QuantileUtility' 'AverageUtility'})

% Graph Results
figure(1)
for j = 1:sdp
    subplot(4,4,1)
    title(sprintf('Dsat trans,Design %j', j))
    plot(dx1(j,:),pd1narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,2) 
    title(sprintf('Dsat rec,Design %j', j))
    plot(dx2(j,:),pd2narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,3)
    title(sprintf('Dground trans,Design %j', j))
    plot(dx3(j,:),pd3narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,4)
    title(sprintf('Dground rec,Design %j', j))
    plot(dx4(j,:),pd4narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,5)
    title(sprintf('Sat long,Design %j', j))
    plot(dx5(j,:),pd5narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,6)
    title(sprintf('Ground long,Design %j', j))
    plot(dx6(j,:),pd6narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,7)
    title(sprintf('Ground lat,Design %j', j))
    plot(dx7(j,:),pd7narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,8)
    title(sprintf('Ground long r,Design %j', j))
    plot(dx8(j,:),pd8narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,9)
    title(sprintf('Ground lat r,Design %j', j))
    plot(dx9(j,:),pd9narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,10)
    title(sprintf('Pst,Design %j', j))
    plot(dx10(j,:),pd10narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,11)
    title(sprintf('Pgt,Design %j', j))
    plot(dx11(j,:),pd11narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,12)
    title(sprintf('f,Design %j', j))
    plot(dx12(j,:),pd12narray(j,:),'color',CM(color_index,:))
    hold on

    subplot(4,4,13)
    title(sprintf('fup,Design %j', j))
    plot(dx13(j,:),pd13narray(j,:),'color',CM(color_index,:))
    
    legend(Legend);
    hold on

    color_index = color_index+1;
end
hold off
