function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
%
% Error checking to make sure the matrix is square
chk=size(A);
if chk(1,1)~=chk(1,2)
    error('Error in matrix dimensions, matrix input must be square')
end
% Create the starting matrices
P=eye(chk(1,1));
L=eye(chk(1,1));
U=A;
for i=1:(chk(1,1)-1)
    %this if statement eliminates the issue of the max location being
    %higher than the columns being used to eliminate coefficients
    if i > 1
        working_column=zeros(chk(1,1),1);
        working_column(i:chk(1,1),1)=abs(U(i:chk(1,1),i));
    else
        working_column=abs(U(:,i));
    end
    [ign,maxloc]=max(working_column);

    if maxloc~=i %checks to see if the largest value is at the top, maxloc
        %is the location of the highest number in the working column
        %pivoting values in the U matix by saving the old values as a new var
        Utemp=U(i,:);
        U(i,:)=U(maxloc,:);
        U(maxloc,:)=Utemp;
        %pivoting the p matrix using the same technique
        Ptemp=P(i,:);
        P(i,:)=P(maxloc,:);
        P(maxloc,:)=Ptemp;
    end
    %starting the forward elim after pivoting
    for n=i+1:chk(1,1)
        f=U(n,i)/U(i,i);
        U(n,:)=U(n,:)-f*U(i,:);
        U(n,i)=0;
        L(n,i)=f; %this line adds the factor used in the elimination step to
        %the L matrix
    end
end
end