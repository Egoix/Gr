function [ClassLabel,SmallClassLabel,goodevents_num] = ClassLabel(Person)
% ���� PSR&CTMafterIMF.m �ļ���� С���� ��ǩ ��ͳ�� goodevents ��Ŀ
%   �����SmallClassLabelΪС�����ǩ �����goodevents_numΪgoodevent����

% ��������
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 

% ͳ��goodevents��Ŀ
goodevents_num = 0;
goodevents_num_c1e1=0; % goodevents_num_c1e1 ��ʾclass01event01����һ�����һС�������goodeventͳ��
goodevents_num_c1e2=0;
goodevents_num_c2e1=0;
goodevents_num_c2e2=0;
goodevents_num_c1=0; % goodevents_num_c1 ��ʾclass01����һ�����goodeventͳ��
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



% С��ǩ
% ����С��ǩ ��ÿ�����Զ���
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

% ���ǩ
ClassLabel = [];
for k = 1: goodevents_num_c1
    ClassLabel(end+1) = 1;
end
for k = goodevents_num_c1+1 : goodevents_num
    ClassLabel(end+1) = 2;
end







end

