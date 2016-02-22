function [tqwtdec,xdata] = Siezure_preprocessing(file_name)
edf_file=load(file_name);
if strcmp(file_name,'seizure.mat')
    data=edf_file.seizure;
else
    data=edf_file.nonseizure1;
end

xdata=data(:,18)';
x = data(:,18)';
fs=173;
ts=1/fs;
t=ts:ts:(length(xdata)*ts);
% noise50=sin(2*pi*50*t);
% x_noise50=xdata+noise50;
% random_noise= rand(1,length(xdata));
% x=xdata+random_noise;
figure;
%subplot(2,2,1);plot(x,'r');hold on;
N=log2(length(x));
N=ceil(N);
%%Discrete Wavelet Transform
% tic;
% [dwtdec,dwtlen]=wavedec(x,N,'db1');
% xidwt=waverec(dwtdec,dwtlen,'db1');
% toc;
% subplot(2,2,2);plot(xidwt,'b');hold on;
% tic;
%%Wavelet Packet Transform
% wptdec=wpdec(x,N,'db1');
% xiwpt=wprec(wptdec);
% toc;
% subplot(2,2,3);plot(xiwpt,'y');hold on;
% tic;
%%Tunable Q Wavelet Transform
r=3;J=21;Q=3; % TQWT parameters
tqwtdec=tqwt_radix2(x,Q,r,J); % TQWT
xitqwt=itqwt_radix2(tqwtdec,Q,r,length(x)); % Inverse TQWT
%subplot(2,2,4);plot(xitqwt);hold on;
%close all;