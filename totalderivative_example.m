clc
clear all;
xo= [0.5 2 3];

A1o = xo(1).^2 - xo(2)
A2o = xo(2).^2 
A3o = A2o + xo(3).^2
yo = (A1o+ A2o*A3o - xo(2))
A = zeros(15,15);
for i = 1:15
    A(i,i) = 1;
end
dA1_dA3 = 0;
dA2_dA3 = 0;
dA1_dA2 = 0;
dA3_dA2 = 1;
dA2_dA1 = 0;
dA3_dA1 = 0;

A(1,6) = -dA1_dA3;
A(2,4) = -dA2_dA3;
A(3,5) = -dA1_dA2;
A(4,2) = -dA3_dA2;
A(5,3) = -dA2_dA1;
A(6,1) = -dA3_dA1;
A(7,8) = -dA1_dA2;
A(7,9) = -dA1_dA3;
A(8,7) = -dA2_dA1;
A(8,9) = -dA2_dA3;
A(9,7) = -dA3_dA1;
A(9,8) = -dA3_dA2;
A(10,11) = -dA1_dA2;
A(10,12) = -dA1_dA3;
A(11,10) = -dA2_dA1;
A(11,12) = -dA2_dA3;
A(12,10) = -dA3_dA1;
A(12,11) = -dA3_dA2;
A(13,14) = -dA1_dA2;
A(13,15) = -dA1_dA3;
A(14,13) = -dA2_dA1;
A(14,15) = -dA2_dA3;
A(15,13) = -dA3_dA1;
A(15,14) = -dA3_dA2;


B = zeros(15,1);

dA1_dX1 = 2*xo(1);
dA2_dX1 = 0;
dA3_dX1 = 0;
dA1_dX2 = -1;
dA2_dX2 = 2*xo(2);
dA3_dX2 = 0;
dA1_dX3 = 0;
dA2_dX3 = 0;
dA3_dX3 = 2*xo(3);

B = [dA1_dA2;dA2_dA1;dA1_dA3;dA3_dA1;dA2_dA3;dA3_dA2;
    dA1_dX1;dA2_dX1;dA3_dX1;dA1_dX2;dA2_dX2;dA3_dX2;dA1_dX3;dA2_dX3;dA3_dX3];


XX = inv(A)*B;

dV_dA1 = 1;
dV_dA2 = 13;
dV_dA3 = 4;
dV_dX1 = 0;
dV_dX2 = -1;
dV_dX3 = 0;

dVV = [dV_dA1 dV_dA2 dV_dA3 dV_dX1 dV_dX2 dV_dX3];
% YY = zeros(6,6);
YY = [XX(13) XX(10) XX(7) XX(3) XX(1) 1;
    XX(14) XX(11) XX(8) XX(5) 1 XX(2);
    XX(15) XX(12) XX(9) 1 XX(6) XX(4);
    0 0 1 0 0 0;
    0 1 0 0 0 0;
    1 0 0 0 0 0];
dV = dVV*YY;


%% Scorecard
% x1 = [];
A1 = -1.7675;
A2 = 3.96;
A3 = 12.87;

Value_Impact_with = [(A1-A1o) dV(6) (A1-A1o)*dV(6);
                (A2-A2o) dV(5) (A2-A2o)*dV(5)];

disp('SSL1 SS1: (With coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(A1-A1o) dV(6) (A1-A1o)*dV(6);
      (A2-A2o) dV(5) (A2-A2o)*dV(5)]);

disp('Total Value Impact with coupling SSL1 SS1 = ')
disp((Value_Impact_with(1,3)+Value_Impact_with(2,3)))


disp('SSL1 SS1: (Without coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(A1-A1o) dV_dA1 (A1-A1o)*dV_dA1;
     (A2-A2o) dV_dA2 (A2-A2o)*dV_dA2]);
 
 Value_Impact_without = [(A1-A1o) dV_dA1 (A1-A1o)*dV_dA1;
     (A2-A2o) dV_dA2 (A2-A2o)*dV_dA2];

disp('Total Value Impact without coupling SSL1 SS1 = ')
disp((Value_Impact_without(1,3)+Value_Impact_without(2,3)))
% New design
% x1 = 0.471672;
% x2 = 1.9899784;
% x3 = 3;
% 
% A11 = x1.^2 - x2
% A21 = x2.^2 
% A31 = A21 + x3.^2
% y11 = (A11+ A21*A31 - x2)


disp('SSL1 SS2: (With coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(A3-A3o) dV(4) (A3-A3o)*dV(4)]);

% disp('Total Value Impact with coupling SSL1 SS1 = ')
% disp((Value_Impact_with(1,3)+Value_Impact_with(2,3)))


disp('SSL1 SS2: (Without coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(A3-A3o) dV_dA3 (A3-A3o)*dV_dA3]);



x1 = 0.5;
x2 = 2;
x3 = 2.978;

disp('SSL2 SS1: (With coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(x1-xo(1)) dV(3) (x1-xo(1))*dV(3);
      (x2-xo(2)) dV(2) (x2-xo(2))*dV(2)]); 
  
disp('SSL2 SS1: (Without coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(x1-xo(1)) 2*xo(1) (x1-xo(1)*2*xo(1));
      (x2-xo(2)) (-2*xo(2)+A3o*2*xo(2)) (x2-xo(2))*(-2*xo(2)+A3o*2*xo(2))]);
  
disp('SSL2 SS2: (With coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(x3-xo(3)) dV(1) (x3-xo(3))*dV(1)]);

disp('SSL2 SS2: (Without coupling)');
disp('    Change in status       x      Gradient         =     Value Impact')
disp([(x3-xo(3)) (2*xo(3)*A2o) (x3-xo(3))*(2*xo(3)*A2o)]);
 

A1o = x1.^2 - x2
A2o = x2.^2 
A3o = A2o + x3.^2
yo = (A1o+ A2o*A3o - x2)
y1 = A1+A2*A3-x2

















