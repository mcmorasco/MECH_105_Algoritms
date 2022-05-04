function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%Mitchell Morasco
n=length(x);
%sizing error check
if length(x)~=length(y)
    error('Inputs must be equal length')
end
%Sorting and filtering
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
Q1=sortedY(floor((n+1)/4));
Q3=sortedY(floor((3*n+3)/4));
IQR=Q3-Q1;
track=logical(zeros(1,n));
for i=1:1:n
    if sortedY(i)<(Q1-(1.5*IQR)) || sortedY(i)>(Q3+(1.5*IQR))
        track(i)=1;
    end
end
fY=sortedY(~track);
fX=sortedX(~track);
n=length(fX);
%Linear regression
sxy=0;
for k=1:n
    sxy_calc=fX(k)*fY(k);
    sxy=sxy_calc+sxy;
end
sx=0;
sy=0;
for k=1:n
    sval_x=fX(k);
    sx=sx+sval_x;
end
for k=1:n
    sval_y=fY(k);
    sy=sy+sval_y;
end
sx_sq=0;
for k=1:n
    sval_xsq=(fX(k))^2;
    sx_sq=sx_sq+sval_xsq;
end
sx_sqr=(sx)^2;
y_bar=mean(fY);
x_bar=mean(fX);
a1=(((n*sxy)-(sx*sy))/((n*sx_sq)-sx_sqr));
a0=y_bar-a1*x_bar;
slope=a1;
intercept=a0;
%create the linear regression equation to use for R-squared
f= @(x) a0+a1.*x;
%R-squared value
ss_tot=0;
for k=1:n
    ssq_val=(fY(k)-y_bar)^2;
    ss_tot=ss_tot+ssq_val;
end
ss_res=0;
for k=1:n
    ssr_val=(fY(k)-f(fX(k)))^2;
    ss_res=ss_res+ssr_val;
end
Rsquared=1-(ss_res/ss_tot);
end
