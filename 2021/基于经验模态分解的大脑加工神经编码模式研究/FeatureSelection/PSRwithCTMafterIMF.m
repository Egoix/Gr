%% 针对之前EMD分解结果进行 PSR 及 CTM 并输出为csv文件
% 步骤：EMD+PSR+CTM
% 输出文件要求：
%     - P1~P6  六个文件夹
%         - R1~R20   20个文件
%             每个文件为trial*(20+2)的二维数组，csv文件
%             trial行 每行5*4=20个数据 + 大s类标签 + 小类标签

%%
clear all;

% 修改Person选择人的编号
Person = '20';

% 加载数据
% 原始数据集
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% EMD结果
eval(['load(''./EMDResult/IMF_CLAS_VP',num2str(Person),'.mat'')']); 
% load('./EMDResult/IMF_CLAS_VP02.mat');

% 五个channel的名称
% ChannelName=["O1","Oz","O2","OI1h","OI2h"];
% 新建文件夹(用于保存结果)
mkdir(['./CTM_Result/VP',num2str(Person)]);  

% 大类标签、小类标签 并统计 good event
[ClassLabel,SmallClassLabel,goodevents_num] = ClassLabel(Person);


%对IMF分量1-4的点数统计 结果为 CTMPoint_IMF_CLAS_VPxx
% r为 CTM半径
for r = 1: 1 :20
    
    % 定义存放结果的结果数组 
    eval(['CTMPoint_IMF_CLAS_VP',num2str(Person),'=zeros(2,80,5,4);']); 
    % CTMPoint_IMF_CLAS_VP02 =zeros(2,80,5,4);
    for taskclass = 1 : 2 
        % 加载trail,共80个trail，两个任务小类
        for trial = 1 : 80
    %         对每个channel 共5个Channel
            for channel = 1 : 5
    %             对IMF1~IMF4 每个IMF统计点数
                for IMF = 1 : 4
                    % 计算CTM pointnum 统计落在圆内的点数
                    pointnum = 0;
                    eval(['signal_k = IMF_CLAS_VP',num2str(Person),'(',num2str(taskclass),',',num2str(trial),',',num2str(channel)',',:,',num2str(IMF),');']); 
                    signal_k = reshape(signal_k,1,4000);
                    signal_k1 = circshift(signal_k,1,2);
                    x=signal_k;
                    y=signal_k1;
                    x_mean = mean(signal_k);
                    y_mean = x_mean;
                    signal_k = signal_k - x_mean;
                    signal_k1 = signal_k1 - y_mean;
                    for t=1:4000
                        if(signal_k(t)*signal_k(t)+signal_k1(t)*signal_k1(t)<r*r)
                            pointnum=pointnum+1;
                        end
                    end
                    eval(['CTMPoint_IMF_CLAS_VP',num2str(Person),' (',num2str(taskclass),',',num2str(trial),',',num2str(channel)',',',num2str(IMF),')=pointnum;']);
               end
            end
        end
    end


% 筛选goodevents
    % 对 allgoodevents 进行变换
    goodevents = reshape(allgoodevents,1,[]);

    % 对 CTMPoint_IMF_CLAS_VP02 进行变变换
    eval(['C_CTMPoint_IMF_CLAS_VP',num2str(Person),' = reshape(CTMPoint_IMF_CLAS_VP',num2str(Person),',[],5,4);']); 
    % C_CTMPoint_IMF_CLAS_VP02 = reshape(CTMPoint_IMF_CLAS_VP02,[],5,4);

    % 进行筛选，除去信号IMF的goodevents中为0的
    for ii = 160:-1:1
        if(goodevents(ii)==0)
            eval(['C_CTMPoint_IMF_CLAS_VP',num2str(Person),'(ii,:,:) =[];']); 
%             C_CTMPoint_IMF_CLAS_VP02(ii,:,:) =[];
        end
    end
    
    
% 数据整理输出
    % 在最后一列加上标签
    ClassLabel = reshape(ClassLabel,goodevents_num,[]);
    SmallClassLabel = reshape(SmallClassLabel,goodevents_num,[]);
     eval(['Outputdata = [reshape(C_CTMPoint_IMF_CLAS_VP',num2str(Person),',[],20), ClassLabel,SmallClassLabel];']); 
    % Outputdata = [reshape(C_CTMPoint_IMF_CLAS_VP02,[],20), ClassLabel,SmallClassLabel];
   
%     csvwrite('./CTM_Result/VP02_R1.csv',Outputdata)
    eval(['csvwrite(''./CTM_Result/VP',num2str(Person),'/VP',num2str(Person),'R',num2str(r),'.csv'',Outputdata);']); 

    
   r  % 输出r便于观察程序进度 
end

