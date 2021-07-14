% 信号进行EMD分解
% 步骤：EMD+

%% 数据集说明
% CLAS_VPxx_onedata_STBFH_MNT （其中xx为01-20的数字）
% 一共20个文件 即20个人的数据
% 每一个数据集中均有 8个数组
% 其中onedata 为信号,是一个大小为 [2,128,4000,80]的四维数组
% allgoodevents 记录了好的/坏的实验实验

%% 本文件 EMDforEachPerson.m 说明
% 每一个数据集中的数据为 [2,128,4000,80]
% 对每一个人的数据 [2,128,4000,80] 进行EMD分解
% 计算全部128个通道的
% 输出储存为 IMF_CLAS_VP02 （VP02表示人，手动修改Person的值来选择数据集）
% 结果保存在EMDResult文件夹中

% EMD:Empirical mode decomposition
%修改记录：IMF_CLAS_VP02_onedata_STBFH_MNT 改为 IMF_CLAS_VP02
%%
clear all;

% 修改Person选择数据集编号
Person = '01';

% 加载数据
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% 定义结果数组 
% 五维数组(任务大类,trial，5个通道（视觉区的五个o开头的通道），4000ms，8个IMF分量中的前6个+原始数据)
eval(['IMF_CLAS_VP',num2str(Person),'=zeros(2,80,128,4000,7);']); 

for taskclass = 1 : 2 
    % 加载trail,共80个trail，两个任务小类
    for trial = 1 : 80
        % 提取每个trial的数据并转换成2维矩阵
        eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
        signal_origin = reshape(signal_origin,128,4000);
%         选取128个通道
        signal_O = signal_origin;
%         对每一个通道做emd分解，把结果放入结果数组中
        for ii = 1:128
            % X为该通道原始数据
            X = signal_O(ii,:);
            imf = emd(X,'Interpolation','pchip')  % emd分解】
%             结果保存
            eval(['IMF_CLAS_VP',num2str(Person),'(taskclass,trial,ii,:,1:5) = imf(:,1:5);']); 
            eval(['IMF_CLAS_VP',num2str(Person),'(taskclass,trial,ii,:,6) = X;']); 
%             IMF_CLAS_VP02(taskclass,trial,ii,:,1:6) = imf(:,1:6);
%             IMF_CLAS_VP02(taskclass,trial,ii,:,7) = X;
        end
    end
end

% 创建文件夹 结果保存路径
mkdir(['./EMDResult']);  
% 结果保存
eval(['save(''./EMDResult/IMF_CLAS_VP',num2str(Person),'.mat'',''IMF_CLAS_VP',num2str(Person),''');']); 
% save('./EMDResult/IMF_CLAS_VP02.mat','IMF_CLAS_VP02');