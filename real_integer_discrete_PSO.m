clc
clear all
tic;
format longEng
c1 = 1;
c2 = 1;
c3 = 1;
dv = 51+12;
n = 300;
lb = [10^9 10^9 10 5 300 0.1 0.1 2 2 0 66 25];
ub = [100*10^9 100*10^9 100 300 10000 5 5 20 20 360 125 50];

par = zeros(n,dv);

vmax = ub-lb/10;
vmin = -vmax;

for i = 1:n
   for j = 1:12
       par(i,j) = rand(1);
   end
end

par(:,1) = lb(1) + (ub(1)-lb(1))*par(:,1); %Applying random nuimber to dv range.
par(:,2) = lb(2) + (ub(2)-lb(2))*par(:,2);
par(:,3) = lb(3) + (ub(3)-lb(3))*par(:,3);
par(:,4) = lb(4) + (ub(4)-lb(4))*par(:,4);
par(:,5) = lb(5) + (ub(5)-lb(5))*par(:,5);
par(:,6) = lb(6) + (ub(6)-lb(6))*par(:,6);
par(:,7) = lb(7) + (ub(7)-lb(7))*par(:,7);
par(:,8) = lb(8) + (ub(8)-lb(8))*par(:,8);
par(:,9) = lb(9) + (ub(9)-lb(9))*par(:,9);
par(:,10) = lb(10) + (ub(10)-lb(10))*par(:,10);
par(:,11) = lb(11) + (ub(11)-lb(11))*par(:,11);
par(:,12) = lb(12) + (ub(12)-lb(12))*par(:,12);

for i = 1:n
    
    
    for j = 13:63
        par(i,j) = (rand(1,1)<=0.5);  
    end
    

    x(13) = par(i,14)*2^0 + par(i,13)*2^1;
    x(14) = par(i,16)*2^0 + par(i,15)*2^1;
    x(15) = par(i,19)*2^0 + par(i,18)*2^1 + par(i,17)*2^2;
    x(16) = par(i,21)*2^0 + par(i,20)*2^1;
    x(17) = par(i,23)*2^0 + par(i,22)*2^1;
    x(18) = par(i,26)*2^0 + par(i,25)*2^1 + par(i,24)*2^2;
    x(19) = par(i,29)*2^0 + par(i,28)*2^1 + par(i,27)*2^2;
    x(20) = par(i,32)*2^0 + par(i,31)*2^1 + par(i,30)*2^2;
    x(21) = par(i,35)*2^0 + par(i,34)*2^1 + par(i,33)*2^2;
    x(22) = par(i,37)*2^0 + par(i,36)*2^1;
    x(23) = par(i,39)*2^0 + par(i,38)*2^1;
    x(24) = par(i,41)*2^0 + par(i,40)*2^1;
    x(25) = par(i,43)*2^0 + par(i,42)*2^1;
    x(26) = par(i,46)*2^0 + par(i,45)*2^1 + par(i,44)*2^2;
    x(27) = par(i,48)*2^0 + par(i,47)*2^1;
    x(28) = par(i,50)*2^0 + par(i,49)*2^1;
    x(29) = par(i,53)*2^0 + par(i,52)*2^1 + par(i,51)*2^2;
    x(30) = par(i,55)*2^0 + par(i,54)*2^1;
    x(31) = par(i,57)*2^0 + par(i,56)*2^1;
    x(32) = par(i,59)*2^0 + par(i,58)*2^1;
    x(33) = par(i,61)*2^0 + par(i,60)*2^1;
    x(34) = par(i,63)*2^0 + par(i,62)*2^1;
    
 
    
    if par(i,14) == 0 & par(i,13) == 0
        par(i,14) = 1;
        
    elseif par(i,16) == 0 & par(i,15) == 0
        par(i,16) = 1;
        
    elseif par(i,19) == 0 & par(i,18) == 0 & par(i,17) == 0
        par(i,19) = 1;
        
    elseif par(i,21) == 0 & par(i,20) == 0
        par(i,21) = 1;
        
        elseif  par(i,23) == 0 & par(i,22) == 0
        par(i,23) = 1;
        
        elseif par(i,26) == 0 & par(i,25) == 0 & par(i,24) == 0
        par(i,24) = 1;
        
    elseif par(i,29) == 0 & par(i,28) == 0 & par(i,27) == 0
        par(i,29) = 1;
        
         elseif  par(i,32) == 0 & par(i,31) == 0 & par(i,30) == 0
        par(i,32) = 1;
        
         elseif  par(i,35) == 0 & par(i,34) == 0 & par(i,33) == 0
        par(i,33) = 1;
        
         elseif  par(i,37) == 0 & par(i,36) == 0
        par(i,37) = 1;
        
         elseif  par(i,39) == 0 & par(i,38) == 0
        par(i,39) = 1;
        
         elseif  par(i,41) == 0 & par(i,40) == 0
        par(i,41) = 1;
        
         elseif  par(i,43) == 0 & par(i,42) == 0 
        par(i,43) = 1;
        
         elseif  par(i,46) == 0 & par(i,45) == 0 & par(i,44) == 0
        par(i,44) = 1;
        
    elseif par(i,48) == 0 & par(i,47) == 0
        par(i,48) = 1;
        
         elseif  par(i,50) == 0 & par(i,49) == 0
        par(i,50) = 1;
        
         elseif  par(i,53) == 0 & par(i,52) == 0 & par(i,51) == 0
        par(i,53) = 1;
         elseif  par(i,55) == 0 & par(i,54) == 0
        par(i,55) = 1;
        
         elseif  par(i,56) == 0 & par(i,57) == 0
        par(i,57) = 1;
        
         elseif  par(i,58) == 0 & par(i,59) == 0
        par(i,59) = 1;
        
         elseif  par(i,60) == 0 & par(i,61) == 0
        par(i,61) = 1;
        
         elseif  par(i,62) == 0 & par(i,63) == 0
        par(i,63) = 1;
    
        
    end
    
    for j = 13:34
        if x(j) == 0
            x(j) = 1;
        end
     
    end
    
    if x(13)>2
        x(13)=2;
    end
    
    if x(14)>2
        x(14)=2;
    end
    
    if x(15)>3
        x(15)=3;
    end
    
    if x(16)>2
        x(16)=2;
    end
    
    if x(17)>2
        x(17)=2;
    end
    
    if x(18)>3
        x(18)=3;
    end
    
    if x(19)>3
        x(19)=3;
    end
    
    if x(20)>3
        x(20)=3;
    end
    
    if x(21)>3
        x(21)=3;
    end
    
    if x(22)>2
        x(22)=2 ;
    end
    
    if x(23)>2
        x(23)=2 ;
    end
    
    if x(24)>2
        x(24)=2 ;
    end
    
    if x(25)>2
        x(25)=2 ;
    end
    
    if x(26)>3
        x(26)=3 ;
    end
    
    if x(27)>2
        x(27)=2 ;
    end
    
    if x(28)>2
        x(28)=2 ;
    end
    
    if x(29)>3
        x(29)=3 ;
    end
    
    if x(30)>2
        x(30)=2 ;
    end
    
    if x(31)>2
        x(31)=2 ;
    end
    
    if x(32)>2
        x(32)=2 ;
    end
    
    if x(33)>2
        x(33)=2 ;
    end
    
    if x(34)>2
        x(34)=2 ;
    end
    
    
    
    
    
    x(1) = par(i,1);
    x(2) = par(i,2);
    x(3) = par(i,3);
    x(4) = par(i,4);
    x(5) = par(i,5);
    x(6) = par(i,6);
    x(7) = par(i,7);
    x(8) = par(i,8);
    x(9) = par(i,9);
    x(10) = par(i,10);
    x(11) = par(i,11);
    x(12) = par(i,12);
    
    if any(x)==0
        disp('pppp')
    end
    f(i) = satellite_objective(x);
    

%   xx = [dec2bin(x(13))];
  
end
x;
par;
f;

[C,I] = min(f);
f_gbest = min(f);
I;
gbest = par(I,:);
f_pbest = f;
pbest = par;
count = 0;
cycles = 5000;
vo = zeros(n,dv);

% for i = 1:n
%     for j = 1:12
% par_c(i,j) = par(i,j);
%     end
% end
%     par_c;
% for i = 1:n
% 
%      r2 = rand(1);
%  
%     for j = 1:12
%         vn(i,j) = (c2*r2*(gbest(j)-par(i,j)));
%     end
% end

while (count < cycles)
    count = count + 1;
    
    for i = 1:n
        r1 = rand(1);
        r2 = rand(1);
        r3 = rand(1);
        w = 1;
        
        
%         for j = 1:12
%         vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
%         end





        for j = 13:63
%           vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
          if par(i,j) == 0 
            if vo(i,j) == 0 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=1;
                    else vn(i,j)=0;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=1;
                    else vn(i,j)=0;
                    end
            end
            
             if vo(i,j) == 1 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=1;
                    else vn(i,j)=0;
                    end
             end
            
              if vo(i,j) == -1 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
              end
            
               if vo(i,j) == -1 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
               end
            
                if vo(i,j) == -1 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
                end
            
                 if vo(i,j) == -1 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=1;
                    end
                 end
          end
      
                 
                 
                 
                 
      if par(i,j) == 1
          if vo(i,j) == 0 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=-1;
                    else vn(i,j)=0;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
            if vo(i,j) == 0 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
            if vo(i,j) == 1 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
            end
            
             if vo(i,j) == 1 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
             end
            
              if vo(i,j) == -1 & pbest(i,j) == 0 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=-1;
                    else vn(i,j)=0;
                    end
              end
            
               if vo(i,j) == -1 & pbest(i,j) == 0 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=-1;
                    else vn(i,j)=0;
                    end
               end
            
                if vo(i,j) == -1 & pbest(i,j) == 1 & gbest(j) == 0
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)>=0.15
                        vn(i,j)=-1;
                    else vn(i,j)=0;
                    end
                end
            
                 if vo(i,j) == -1 & pbest(i,j) == 1 & gbest(j) == 1
              vn(i,j) = (vo(i,j)+ c1*r1*(pbest(i,j)-par(i,j))+(c2*r2*(gbest(j)-par(i,j))));
                    if rand(1)<=0.5
                        vn(i,j)=0;
                    else vn(i,j)=-1;
                    end
                 end
      end
        end

for j = 1:12
    w = ((.9-0.4).*(cycles-count))./(cycles+0.4);
%      w = 0.8;
    vn(i,j) = (w*vo(i,j)+ 2*r1*(pbest(i,j)-par(i,j))+(2*r2*(gbest(j)-par(i,j))));
end

for jj = 1:12,
    
vn(i,jj) = min(vmax(jj),max(vmin(jj),vn(i,jj)));
end

par1(i,:) = par(i,:)+vn(i,:);
% 
% for jj = 1:12,
%     
% vn(i,jj) = min(vmax(jj),max(vmin(jj),vn(i,jj)));
% end

% par1(i,:) = par(i,:)+vn(i,:);

for jjjj = 1:12
        if par1(i,jjjj) <lb(jjjj)
            par1(i,jjjj) = lb(jjjj);
            
        end
        if par1(i,jjjj) > ub(jjjj)
            par1(i,jjjj) = ub(jjjj);
            
        end
end


    
    x(13) = par1(i,14)*2^0 + par1(i,13)*2^1;
    x(14) = par1(i,16)*2^0 + par1(i,15)*2^1;
    x(15) = par1(i,19)*2^0 + par1(i,18)*2^1 + par1(i,17)*2^2;
    x(16) = par1(i,21)*2^0 + par1(i,20)*2^1;
    x(17) = par1(i,23)*2^0 + par1(i,22)*2^1;
    x(18) = par1(i,26)*2^0 + par1(i,25)*2^1 + par1(i,24)*2^2;
    x(19) = par1(i,29)*2^0 + par1(i,28)*2^1 + par1(i,27)*2^2;
    x(20) = par1(i,32)*2^0 + par1(i,31)*2^1 + par1(i,30)*2^2;
    x(21) = par1(i,35)*2^0 + par1(i,34)*2^1 + par1(i,33)*2^2;
    x(22) = par1(i,37)*2^0 + par1(i,36)*2^1;
    x(23) = par1(i,39)*2^0 + par1(i,38)*2^1;
    x(24) = par1(i,41)*2^0 + par1(i,40)*2^1;
    x(25) = par1(i,43)*2^0 + par1(i,42)*2^1;
    x(26) = par1(i,46)*2^0 + par1(i,45)*2^1 + par1(i,44)*2^2;
    x(27) = par1(i,48)*2^0 + par1(i,47)*2^1;
    x(28) = par1(i,50)*2^0 + par1(i,49)*2^1;
    x(29) = par1(i,53)*2^0 + par1(i,52)*2^1 + par1(i,51)*2^2;
    x(30) = par1(i,55)*2^0 + par1(i,54)*2^1;
    x(31) = par(i,57)*2^0 + par(i,56)*2^1;
    x(32) = par(i,59)*2^0 + par(i,58)*2^1;
    x(33) = par(i,61)*2^0 + par(i,60)*2^1;
    x(34) = par(i,63)*2^0 + par(i,62)*2^1;
 
    par(i,:) = par1(i,:);
    
    for j = 13:34
        if x(j) == 0
            x(j) = 1;
        end
     
    end
    
    if x(13)>2
        x(13)=2;
    end
    
    if x(14)>2
        x(14)=2;
    end
    
    if x(15)>3
        x(15)=3;
    end
    
    if x(16)>2
        x(16)=2;
    end
    
    if x(17)>2
        x(17)=2;
    end
    
    if x(18)>3
        x(18)=3;
    end
    
    if x(19)>3
        x(19)=3;
    end
    
    if x(20)>3
        x(20)=3;
    end
    
    if x(21)>3
        x(21)=3;
    end
    
    if x(22)>2
        x(22)=2 ;
    end
    
    if x(23)>2
        x(23)=2 ;
    end
    
    if x(24)>2
        x(24)=2 ;
    end
    
    if x(25)>2
        x(25)=2 ;
    end
    
    if x(26)>3
        x(26)=3 ;
    end
    
    if x(27)>2
        x(27)=2 ;
    end
    
    if x(28)>2
        x(28)=2 ;
    end
    
    if x(29)>3
        x(29)=3 ;
    end
    
    if x(30)>2
        x(30)=2 ;
    end
    
    if x(31)>2
        x(31)=2 ;
    end
    
    if x(32)>2
        x(32)=2 ;
    end
    
    if x(33)>2
        x(33)=2 ;
    end
    
    if x(34)>2
        x(34)=2 ;
    end
    
    
    
    x(1) = par(i,1);
    x(2) = par(i,2);
    x(3) = par(i,3);
    x(4) = par(i,4);
    x(5) = par(i,5);
    x(6) = par(i,6);
    x(7) = par(i,7);
    x(8) = par(i,8);
    x(9) = par(i,9);
    x(10) = par(i,10);
    x(11) = par(i,11);
    x(12) = par(i,12);
    

    f(i) = satellite_objective(x);
    
        par(i,:) = par1(i,:);
    
     if (f_pbest(i)>f(i))
       f_pbest(i) = f(i);
       for j = 1:dv
           pbest(i,j) = par(i,j);
       end
   end
      
    end

vn;
par;
pbest;
vo = vn;
vn;

 [C,I] = min(f);
 if (f_gbest>min(f))
   f_gbest = min(f);
   gbest = par(I,:);
 end

gbest_continous = gbest(1:12)
%     gbest_discrete(1) = gbest(14)*2^0 + gbest(13)*2^1;
%     gbest_discrete(2) = gbest(16)*2^0 + gbest(15)*2^1;
%     gbest_discrete(3) = gbest(19)*2^0 + gbest(18)*2^1 + gbest(17)*2^2;
%     gbest_discrete(4)= gbest(21)*2^0 + gbest(20)*2^1;
%     gbest_discrete(5) = gbest(23)*2^0 + gbest(22)*2^1;
%     gbest_discrete(6) = gbest(26)*2^0 + gbest(25)*2^1 + gbest(24)*2^2;
%     gbest_discrete(7) = gbest(29)*2^0 + gbest(28)*2^1 + gbest(27)*2^2;
%     gbest_discrete(8) = gbest(32)*2^0 + gbest(31)*2^1 + gbest(30)*2^2;
%     gbest_discrete(9) = gbest(35)*2^0 + gbest(34)*2^1 + gbest(33)*2^2;
%     gbest_discrete(10) = gbest(37)*2^0 + gbest(36)*2^1;
%     gbest_discrete(11) = gbest(39)*2^0 + gbest(38)*2^1;
%     gbest_discrete(12) = gbest(41)*2^0 + gbest(40)*2^1;
%     gbest_discrete(13) = gbest(43)*2^0 + gbest(42)*2^1;
%     gbest_discrete(14) = gbest(46)*2^0 + gbest(45)*2^1 + gbest(44)*2^2;
%     gbest_discrete(15) = gbest(48)*2^0 + gbest(47)*2^1;
%     gbest_discrete(16) = gbest(50)*2^0 + gbest(49)*2^1;
%     gbest_discrete(17) = gbest(53)*2^0 + gbest(52)*2^1 + gbest(51)*2^2;
%     gbest_discrete(18) = gbest(55)*2^0 + gbest(54)*2^1;
    
    gbest_discrete = x(13:30)

f_gbest
end























        
