% 进行EMD分解

clear all;

% 修改Person选择数据集编号
Person = '01';

% 加载数据
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% 定义结果数组 
% 五维数组(任务大类,trial，5个通道（视觉区的五个o开头的通道），4000ms，8个IMF分量中的前6个+原始数据)
% eval(['IMF_CLAS_VP',num2str(Person),'=zeros(2,80,128,4000,7);']); 

taskclass = 1
trial = 3
eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
signal_origin = reshape(signal_origin,128,4000);
signal_O = signal_origin;
ii = 29
X = signal_O(ii,:);
emd(X,'Interpolation','pchip')  % emd分解

% 
% for taskclass = 1 : 1 
%     % 加载trail,共80个trail，两个任务小类
%     for trial = 1 : 1
%         % 提取每个trial的数据并转换成2维矩阵
%         eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
%         signal_origin = reshape(signal_origin,128,4000);
% %         选取128个通道
%         signal_O = signal_origin;
% %         对每一个通道做emd分解，把结果放入结果数组中
%         for ii = 1:128
%             % X为该通道原始数据
%             X = signal_O(ii,:);
%             imf = emd(X,'Interpolation','pchip')  % emd分解】
%         end
%     end
% end