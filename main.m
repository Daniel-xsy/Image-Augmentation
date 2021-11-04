clear;
clc;
img = imread('img.jpg'); 
gray = rgb2gray(img);   % 转化为灰度图

F = dft(gray); % 傅里叶变换
F_ = log(abs(F)*10e4 + 1);
img_out = homofilter(gray,200,2); % 同态滤波
img_out = uint8(img_out);
imghist = histogram(gray, 0);% 计算灰度直方图
new_img = equalization(imghist, gray); % 灰度均衡化
new_img = uint8(new_img);
imshow(gray);title('同态滤波');
% subplot(2,2,1);imshow(gray);title('灰度');
% subplot(2,2,2);imshow(F_,[]);title('频谱');
% subplot(2,2,3);imshow(img_out);title('同态滤波');
% subplot(2,2,4);imshow(new_img);title('直方图均衡化')
