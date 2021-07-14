%% ���֮ǰEMD�ֽ������� PSR �� CTM �����Ϊcsv�ļ�
% ���裺EMD+PSR+CTM
% ����ļ�Ҫ��
%     - P1~P6  �����ļ���
%         - R1~R20   20���ļ�
%             ÿ���ļ�Ϊtrial*(20+2)�Ķ�ά���飬csv�ļ�
%             trial�� ÿ��5*4=20������ + ��s���ǩ + С���ǩ

%%
clear all;

% �޸�Personѡ���˵ı��
Person = '20';

% ��������
% ԭʼ���ݼ�
eval(['load(''D:\project\BrainEEG\data\CLAS_VP',num2str(Person),'_onedata_STBFH_MNT.mat'')']); 
% EMD���
eval(['load(''./EMDResult/IMF_CLAS_VP',num2str(Person),'.mat'')']); 
% load('./EMDResult/IMF_CLAS_VP02.mat');

% ���channel������
% ChannelName=["O1","Oz","O2","OI1h","OI2h"];
% �½��ļ���(���ڱ�����)
mkdir(['./CTM_Result/VP',num2str(Person)]);  

% �����ǩ��С���ǩ ��ͳ�� good event
[ClassLabel,SmallClassLabel,goodevents_num] = ClassLabel(Person);


%��IMF����1-4�ĵ���ͳ�� ���Ϊ CTMPoint_IMF_CLAS_VPxx
% rΪ CTM�뾶
for r = 1: 1 :20
    
    % �����Ž���Ľ������ 
    eval(['CTMPoint_IMF_CLAS_VP',num2str(Person),'=zeros(2,80,5,4);']); 
    % CTMPoint_IMF_CLAS_VP02 =zeros(2,80,5,4);
    for taskclass = 1 : 2 
        % ����trail,��80��trail����������С��
        for trial = 1 : 80
    %         ��ÿ��channel ��5��Channel
            for channel = 1 : 5
    %             ��IMF1~IMF4 ÿ��IMFͳ�Ƶ���
                for IMF = 1 : 4
                    % ����CTM pointnum ͳ������Բ�ڵĵ���
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


% ɸѡgoodevents
    % �� allgoodevents ���б任
    goodevents = reshape(allgoodevents,1,[]);

    % �� CTMPoint_IMF_CLAS_VP02 ���б�任
    eval(['C_CTMPoint_IMF_CLAS_VP',num2str(Person),' = reshape(CTMPoint_IMF_CLAS_VP',num2str(Person),',[],5,4);']); 
    % C_CTMPoint_IMF_CLAS_VP02 = reshape(CTMPoint_IMF_CLAS_VP02,[],5,4);

    % ����ɸѡ����ȥ�ź�IMF��goodevents��Ϊ0��
    for ii = 160:-1:1
        if(goodevents(ii)==0)
            eval(['C_CTMPoint_IMF_CLAS_VP',num2str(Person),'(ii,:,:) =[];']); 
%             C_CTMPoint_IMF_CLAS_VP02(ii,:,:) =[];
        end
    end
    
    
% �����������
    % �����һ�м��ϱ�ǩ
    ClassLabel = reshape(ClassLabel,goodevents_num,[]);
    SmallClassLabel = reshape(SmallClassLabel,goodevents_num,[]);
     eval(['Outputdata = [reshape(C_CTMPoint_IMF_CLAS_VP',num2str(Person),',[],20), ClassLabel,SmallClassLabel];']); 
    % Outputdata = [reshape(C_CTMPoint_IMF_CLAS_VP02,[],20), ClassLabel,SmallClassLabel];
   
%     csvwrite('./CTM_Result/VP02_R1.csv',Outputdata)
    eval(['csvwrite(''./CTM_Result/VP',num2str(Person),'/VP',num2str(Person),'R',num2str(r),'.csv'',Outputdata);']); 

    
   r  % ���r���ڹ۲������� 
end

