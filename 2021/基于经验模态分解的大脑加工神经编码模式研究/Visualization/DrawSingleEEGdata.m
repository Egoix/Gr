%% ����һ��EEG�ź�ʾ��
clear all;

% �޸�Personѡ�����ݼ����
Person = '01';

% ��������
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% load('D:\project\BrainEEG\data\CLAS_VP02_onedata_STBFH_MNT.mat')

% ���������� 
% ��ά����(5��ͨ�����Ӿ��������o��ͷ��ͨ������4000ms��8��IMF�����е�ǰ6��+ԭʼ����)
eval(['IMF_CLAS_VP',num2str(Person),'=zeros(5,4000,6);']); 
% IMF_CLAS_VP02 =zeros(2,80,5,4000,7);

taskclass = 1;
trial = 2;

% ��ȡÿ��trial�����ݲ�ת����2ά����
eval(['signal_origin = onedata(',num2str(taskclass),',:,:,',num2str(trial),');']); 
signal_origin = reshape(signal_origin,128,4000);

plot(signal_origin(2,1:1000))
