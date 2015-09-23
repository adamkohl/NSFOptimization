
function [y] = example(x)

            A1 = x(1).^2 - x(2)
            A2 = x(2).^2 
            A3 = A2 + x(3).^2
            y = (A1+ A2*A3 - x(2))
            
end