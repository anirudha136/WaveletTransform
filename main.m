clear all;
close all;
r=3;
Q=3;
    [tqwtdec,xdata]=Siezure_preprocessing('nonseizure1.mat');
for i=1:14
    tqwtdec{1, i}=tqwtdec{1, i}*0;
end
xitqwt=itqwt_radix2(tqwtdec,Q,r,length(xdata)); % Inverse TQWT
xitqwt=xitqwt-mean(xitqwt);
xdata= xdata-mean(xdata);
mserror=(1/length(xdata))*sum((xitqwt-xdata).^2)
% plot(xdata)
% hold on
plot(xitqwt,'r')
title('nonseizure');
%stem(mserror);



[tqwtdec,xdata]=Siezure_preprocessing('seizure.mat');
for i=1:14
    tqwtdec{1, i}=tqwtdec{1, i}*0;
end
xitqwt=itqwt_radix2(tqwtdec,Q,r,length(xdata)); % Inverse TQWT
xitqwt=xitqwt-mean(xitqwt);
xdata= xdata-mean(xdata);
mserror=(1/length(xdata))*sum((xitqwt-xdata).^2)

% plot(xdata)
% hold on
plot(xitqwt,'r')
title('seizure');