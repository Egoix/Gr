# @Time         :   2021/4/29 15:44
# @ProblemName  :   plot_4_yuan_0429

import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
import pandas as pd
import numpy as np

simsun = FontProperties(fname=r'C:\Windows\Fonts\simsun.ttc', size=10) # 宋体
roman = FontProperties(fname=r'C:\Windows\Fonts\times.ttf', size=10) # Times new roman

df = pd.read_csv("Emotion_features1.csv", index_col=0)
plt.figure(figsize=(10, 10))
plt.ylabel("Density")
for i , feature_name in enumerate(['tempo','total_beats','average_beats','chroma_stft_mean','chroma_stft_std','chroma_stft_var','chroma_cq_mean','chroma_cq_std','chroma_cq_var','chroma_cens_mean','chroma_cens_std','chroma_cens_var','melspectrogram_mean','melspectrogram_std','melspectrogram_var','mfcc_mean','mfcc_std','mfcc_var','mfcc_delta_mean','mfcc_delta_std','mfcc_delta_var','rmse_mean','rmse_std','rmse_var','cent_mean','cent_std','cent_var','spec_bw_mean','spec_bw_std','spec_bw_var','contrast_mean','contrast_std','contrast_var','rolloff_mean','rolloff_std','rolloff_var','poly_mean','poly_std','poly_var','tonnetz_mean','tonnetz_std','tonnetz_var','zcr_mean','zcr_std','zcr_var','harm_mean','harm_std','harm_var','perc_mean','perc_std','perc_var','frame_mean','frame_std','frame_var']):
    all = df[feature_name].tolist()
    mean = np.mean(all)
    std = np.std(all)
    c1 = (np.array(df[feature_name].loc[df['label'] == 1]) - mean) / std
    c2 = (np.array(df[feature_name].loc[df['label'] == 2]) - mean) / std
    c3 = (np.array(df[feature_name].loc[df['label'] == 3]) - mean) / std
    c4 = (np.array(df[feature_name].loc[df['label'] == 4]) - mean) / std
    c5 = (np.array(df[feature_name].loc[df['label'] == 5]) - mean) / std

    plt.subplot(5, 5, 1)
    sns.distplot(c1, color='g')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel(f"{feature_name}",fontproperties=roman)
    plt.xlabel('愤怒',fontproperties=simsun)
    plt.subplot(5, 5,  2)
    sns.distplot(c2, color='brown')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    plt.xlabel('压抑',fontproperties=simsun)
    plt.subplot(5, 5, 3)
    sns.distplot(c3, color='r')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    plt.xlabel('暴躁',fontproperties=simsun)
    plt.subplot(5, 5, 4)
    sns.distplot(c4, color='b')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    plt.xlabel('绝望',fontproperties=simsun)
    plt.subplot(5, 5, 5)
    sns.distplot(c5, color='y')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    plt.xlabel('悲伤',fontproperties=simsun)
    plt.show()
    plt.savefig(".\\si2\\" + f"{feature_name}" + ".png")
    

plt.figure(figsize=(10, 4))
plt.ylabel("Density")
for i , feature_name in enumerate(['cent_std', 'rolloff_std']):
    all = df[feature_name].tolist()
    mean = np.mean(all)

    std = np.std(all)
    c1 = (np.array(df[feature_name].loc[df['label'] == 1]) - mean) / std
    c2 = (np.array(df[feature_name].loc[df['label'] == 2]) - mean) / std
    c3 = (np.array(df[feature_name].loc[df['label'] == 3]) - mean) / std
    c4 = (np.array(df[feature_name].loc[df['label'] == 4]) - mean) / std
    c5 = (np.array(df[feature_name].loc[df['label'] == 5]) - mean) / std

    plt.subplot(2, 5, 5 * i + 1)
    sns.distplot(c1, color='g')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel(f"{feature_name}")
    if i == 1:
        plt.xlabel(['angry'])
    plt.subplot(2, 5, 5 * i + 2)
    sns.distplot(c2, color='brown')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    if i == 1:
        plt.xlabel(['depressed'])
    plt.subplot(2, 5, 5 * i + 3)
    sns.distplot(c3, color='r')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    if i == 1:
        plt.xlabel(['feverish'])
    plt.subplot(2, 5, 5 * i + 4)
    sns.distplot(c4, color='b')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    if i == 1:
        plt.xlabel(['desperate'])
    plt.subplot(2, 5, 5 * i + 5)
    sns.distplot(c5, color='y')
    plt.xlim([-5, 5])
    plt.ylim([0, 1])
    plt.ylabel('')
    if i == 1:
        plt.xlabel(['sorrowful'])
    # plt.savefig(f"G:\Learn_Python\My_Jupyter\Hello_LeetCode\\test\pic\\{feature_name}.png")
plt.show()


