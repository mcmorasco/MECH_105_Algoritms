function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method
%set defaults if stopping error or max iterations aren't entered
%Mitchell Morasco 3/5/22 MECH 105 Dr. B
if nargin==3 %only 3 input arguements means that the user didn't input es or maxit
    es=0.0001;
    maxit=200;
elseif nargin==4 %4 input arguements means the user didn't input maxit but did specify a stopping error
    maxit=200;
end
%now error check to make sure that the limit is bounded by xl and xu and
%that the guess isn't the root
if func(xl)*func(xu)>=0
    error('bounds do not bracket a root')
elseif func(xl)==0
    root=xl;
elseif func(xu)==0
    root=xu;
end
%root calculations
xr=xl;
iter=0;
ea=100;
while (1)
    if ea<es || iter>=maxit || func(xr)==0  %these are the criteria to break out of the loop
        break
    end
    iter=iter+1;
    xr_old=xr;
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-(func(xu))));
    if func(xr)==0
        ea=0;
        break
    end
    ea=abs((xr-xr_old)/xr)*100;
    check=func(xl)*func(xr);
    if check>=0
        xu_old=xu;
        xu=xr;
    elseif check<=0
        xl_old=xl;
        xl=xr;
    end
end
root=xr;
fx=func(xr);
end
