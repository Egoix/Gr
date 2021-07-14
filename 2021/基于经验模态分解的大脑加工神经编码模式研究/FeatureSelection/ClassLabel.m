function [ClassLabel,SmallClassLabel,goodevents_num] = ClassLabel(Person)
% 用于 PSR&CTMafterIMF.m 文件添加 小分类 标签 并统计 goodevents 数目
%   输出的SmallClassLabel为小分类标签 输出的goodevents_num为goodevent数量

% 加载数据
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 

% 统计goodevents数目
goodevents_num = 0;
goodevents_num_c1e1=0; % goodevents_num_c1e1 表示class01event01即第一大类第一小类任务的goodevent统计
goodevents_num_c1e2=0;
goodevents_num_c2e1=0;
goodevents_num_c2e2=0;
goodevents_num_c1=0; % goodevents_num_c1 表示class01即第一大类的goodevent统计
goodevents_num_c2=0;
for ii = 1:2
    for jj = 1: 40
        if (allgoodevents(ii,jj)==1 && ii==1)
            goodevents_num_c1e1= goodevents_num_c1e1+1;
            goodevents_num= goodevents_num+1;
            goodevents_num_c1= goodevents_num_c1+1;
        end
        if (allgoodevents(2,jj)==1 && ii==2)
            goodevents_num_c2e1= goodevents_num_c2e1+1;
            goodevents_num= goodevents_num+1;
            goodevents_num_c2= goodevents_num_c2+1;
        end
    end
    for jj = 41: 80
        if (allgoodevents(1,jj)==1 && ii==1)
            goodevents_num_c1e2= goodevents_num_c1e2+1;
            goodevents_num= goodevents_num+1;
            goodevents_num_c1= goodevents_num_c1+1;
        end
        if (allgoodevents(2,jj)==1 && ii==2)
            goodevents_num_c2e2= goodevents_num_c2e2+1;
            goodevents_num= goodevents_num+1;
            goodevents_num_c2= goodevents_num_c2+1;
        end
    end
end



% 小标签
% 设置小标签 对每个人自定义
SmallClassLabel = [];
for k = 1: goodevents_num_c1e1
    SmallClassLabel(end+1) = 1;
end
for k = goodevents_num_c1e1+1 : goodevents_num_c1e1+goodevents_num_c1e2
    SmallClassLabel(end+1) = 2;
end
for k = goodevents_num_c1e1+goodevents_num_c1e2+1 : goodevents_num_c1e1+goodevents_num_c1e2+goodevents_num_c2e1
    SmallClassLabel(end+1) = 1;
end
for k = goodevents_num_c1e1+goodevents_num_c1e2+goodevents_num_c2e1+1 : goodevents_num
    SmallClassLabel(end+1) = 2;
end

% 大标签
ClassLabel = [];
for k = 1: goodevents_num_c1
    ClassLabel(end+1) = 1;
end
for k = goodevents_num_c1+1 : goodevents_num
    ClassLabel(end+1) = 2;
end







end

