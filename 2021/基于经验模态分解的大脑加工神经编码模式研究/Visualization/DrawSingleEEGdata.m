%% 绘制一个EEG信号示例
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
trial = 2;

% 提取每个trial的数据并转换成2维矩阵
eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
signal_origin = reshape(signal_origin,128,4000);

plot(signal_origin(2,1:1000))
