% �źŽ���EMD�ֽ�
% ���裺EMD+

%% ���ݼ�˵��
% CLAS_VPxx_onedata_STBFH_MNT ������xxΪ01-20�����֣�
% һ��20���ļ� ��20���˵�����
% ÿһ�����ݼ��о��� 8������
% ����onedata Ϊ�ź�,��һ����СΪ [2,128,4000,80]����ά����
% allgoodevents ��¼�˺õ�/����ʵ��ʵ��

%% ���ļ� EMDforEachPerson.m ˵��
% ÿһ�����ݼ��е�����Ϊ [2,128,4000,80]
% ��ÿһ���˵����� [2,128,4000,80] ����EMD�ֽ�
% ����ȫ��128��ͨ����
% �������Ϊ IMF_CLAS_VP02 ��VP02��ʾ�ˣ��ֶ��޸�Person��ֵ��ѡ�����ݼ���
% ���������EMDResult�ļ�����

% EMD:Empirical mode decomposition
%�޸ļ�¼��IMF_CLAS_VP02_onedata_STBFH_MNT ��Ϊ IMF_CLAS_VP02
%%
clear all;

% �޸�Personѡ�����ݼ����
Person = '01';

% ��������
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% ���������� 
% ��ά����(�������,trial��5��ͨ�����Ӿ��������o��ͷ��ͨ������4000ms��8��IMF�����е�ǰ6��+ԭʼ����)
eval(['IMF_CLAS_VP',num2str(Person),'=zeros(2,80,128,4000,7);']); 

for taskclass = 1 : 2 
    % ����trail,��80��trail����������С��
    for trial = 1 : 80
        % ��ȡÿ��trial�����ݲ�ת����2ά����
        eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
        signal_origin = reshape(signal_origin,128,4000);
%         ѡȡ128��ͨ��
        signal_O = signal_origin;
%         ��ÿһ��ͨ����emd�ֽ⣬�ѽ��������������
        for ii = 1:128
            % XΪ��ͨ��ԭʼ����
            X = signal_O(ii,:);
            imf = emd(X,'Interpolation','pchip')  % emd�ֽ⡿
%             �������
            eval(['IMF_CLAS_VP',num2str(Person),'(taskclass,trial,ii,:,1:5) = imf(:,1:5);']); 
            eval(['IMF_CLAS_VP',num2str(Person),'(taskclass,trial,ii,:,6) = X;']); 
%             IMF_CLAS_VP02(taskclass,trial,ii,:,1:6) = imf(:,1:6);
%             IMF_CLAS_VP02(taskclass,trial,ii,:,7) = X;
        end
    end
end

% �����ļ��� �������·��
mkdir(['./EMDResult']);  
% �������
eval(['save(''./EMDResult/IMF_CLAS_VP',num2str(Person),'.mat'',''IMF_CLAS_VP',num2str(Person),''');']); 
% save('./EMDResult/IMF_CLAS_VP02.mat','IMF_CLAS_VP02');