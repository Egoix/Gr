% 画出视觉区5通道的脑电信号
clear all;

% 修改Person选择数据集编号
Person = '01';

% 加载数据
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% 定义结果数组 
% 五维数组(5个通道（视觉区的五个o开头的通道），4000ms，8个IMF分量中的前6个+原始数据)
eval(['IMF_CLAS_VP',num2str(Person),'=zeros(5,4000,6);']); 
% IMF_CLAS_VP02 =zeros(2,80,5,4000,7);

taskclass = 1;
trial = 3;

% 提取每个trial的数据并转换成2维矩阵
eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
signal_origin = reshape(signal_origin,128,4000);
%         选取O开头通道： 29 30 31 126 127 
signal_O = signal_origin([29:31,126:127],:);

signal_O1 = signal_O(1,:);
signal_Oz = signal_O(1,:);
signal_O2 = signal_O(1,:);
signal_OL1h = signal_O(1,:);
signal_OL2h = signal_O(1,:);


set(gcf,'unit','centimeters','position',[1 3 35 15])



% figure1;
subplot(5,1,1);
plot(signal_O1);
title('O1');

% figure2;
subplot(5,1,2);
plot(signal_Oz);
title('Oz');

% figure3;
subplot(5,1,3);
plot(signal_O2);
title('O2');

% figure4;
subplot(5,1,4);
plot(signal_OL1h);
title('OL1h');

% figure5;
subplot(5,1,5);
plot(signal_OL2h);
title('OL2h');
