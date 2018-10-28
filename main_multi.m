clc;
clear all;
data=dlmread('ex1data2.txt');
X=data(:,1:2);
Y=data(:,3);
figure(1);

X=[ones(size(Y,1),1) X];
%feature scaling
average(1)=sum(X(:,2))/size(X,1);
sd(1)=max(X(:,2))-min(X(:,2));
X(:,2)=X(:,2)-average(1);
X(:,2)=X(:,2)/sd(1);

average(2)=sum(X(:,3))/size(X,1);
sd(2)=max(X(:,3))-min(X(:,3));
X(:,3)=X(:,3)-average(2);
X(:,2)=X(:,2)/sd(2);

%converting two variable to one to plot
plot_var=X(:,2).*X(:,3);
plot(plot_var,Y,'rx');

theta=rand([1 2]);
alpha=0.1;

%---------------------------------------------------------
%batch gradient descent
for j=1:300
%hypothesis
Hb=plot_var*(theta');
%cost function
Jb(j)=sum(((Hb-Y).*(Hb-Y)));
Jb(j)=Jb(j)/(2*size(X,1));
%gradient
for i=1:size(theta,2)
grad_b(i)=sum(((Hb-Y).*(X(:,i))));
end
grad_b=grad_b/(size(X,1));
theta=theta-(alpha*grad_b);
end

%ploting cost function
figure(2)
i=1:300;
plot(i,Jb);
% plotting hypothesis
% figure(3)
% hold on
% plot(plot_var,Y,'rx');
% plH=X*(theta');
% plot(1:size(X,1),plH);
% hold off
