% ����EMD�ֽ�

clear all;

% �޸�Personѡ�����ݼ����
Person = '01';

% ��������
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% ���������� 
% ��ά����(�������,trial��5��ͨ�����Ӿ��������o��ͷ��ͨ������4000ms��8��IMF�����е�ǰ6��+ԭʼ����)
% eval(['IMF_CLAS_VP',num2str(Person),'=zeros(2,80,128,4000,7);']); 

taskclass = 1
trial = 3
eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
signal_origin = reshape(signal_origin,128,4000);
signal_O = signal_origin;
ii = 29
X = signal_O(ii,:);
emd(X,'Interpolation','pchip')  % emd�ֽ�

% 
% for taskclass = 1 : 1 
%     % ����trail,��80��trail����������С��
%     for trial = 1 : 1
%         % ��ȡÿ��trial�����ݲ�ת����2ά����
%         eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
%         signal_origin = reshape(signal_origin,128,4000);
% %         ѡȡ128��ͨ��
%         signal_O = signal_origin;
% %         ��ÿһ��ͨ����emd�ֽ⣬�ѽ��������������
%         for ii = 1:128
%             % XΪ��ͨ��ԭʼ����
%             X = signal_O(ii,:);
%             imf = emd(X,'Interpolation','pchip')  % emd�ֽ⡿
%         end
%     end
% end