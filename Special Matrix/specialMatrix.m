function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m)
if nargin~=2
    error('There need to be exactly two inputs for the function specialMatrix to run')
end
% Now the real challenge is to fill in the correct values of A
A=zeros(n,m);
%Setting the first row and column
for i=1:n
    for k=1:m
        if i==1
            A(i,k)=k; %This sets the first column
        else
            A(i,k)=i; %This sets the first row
        end
    end
end
%Now doing the inside addition, the index starts at two because we've
%already taken care of the first row and column.
for i=2:n
    for k=2:m
        A(i,k)=A(i-1,k)+A(i,k-1);
    end
end
end
% Things beyond here are outside of your function
