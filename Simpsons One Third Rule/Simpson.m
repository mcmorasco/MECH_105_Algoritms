function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x)~= length(y)
    error('Input vectors need to be the same length')
end
e_check=rem(length(x)-1,2);
I=0;
h=(x(end)-x(1,1));
if length(x)==2
    warning('Simpsons 1/3 rule cannot be applied, trapezoidal rule is being used instead')
    I=0.5*h*(y(end)+y(1,1));
elseif e_check==1
    warning('Simpsons 1/3 cannot be applied for all segments, trapezoidal rule will be used for final segment')
    %Simpsons 1/3 if the input has an odd number of segments
    for i=1:2:length(x)-3
        h=(x(i+2)-x(i));
        I_seg=((h/6)*(y(i)+4*y(i+1)+y(i+2)));
        I=I+I_seg;
    end
    trap=0.5*(x(end)-x(end-2))*((y(end)+y(end-2)));
    I=I+trap;
else
    %Simpsons 1/3 if the input has an even number of segments
    for i=1:2:(length(x)-2)
        h=(x(i+2)-x(i));
        I_seg=((h/6)*(y(i)+4*y(i+1)+y(i+2)));
        I=I+I_seg;
    end
end
end