clear;
clc;
img = imread('img.jpg'); 
gray = rgb2gray(img);   % ת��Ϊ�Ҷ�ͼ

F = dft(gray); % ����Ҷ�任
F_ = log(abs(F)*10e4 + 1);
img_out = homofilter(gray,200,2); % ̬ͬ�˲�
img_out = uint8(img_out);
imghist = histogram(gray, 0);% ����Ҷ�ֱ��ͼ
new_img = equalization(imghist, gray); % �ҶȾ��⻯
new_img = uint8(new_img);
imshow(gray);title('̬ͬ�˲�');
% subplot(2,2,1);imshow(gray);title('�Ҷ�');
% subplot(2,2,2);imshow(F_,[]);title('Ƶ��');
% subplot(2,2,3);imshow(img_out);title('̬ͬ�˲�');
% subplot(2,2,4);imshow(new_img);title('ֱ��ͼ���⻯')
