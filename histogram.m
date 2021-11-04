function imghist = histogram(img, show)
    [h, w] = size(img);
    imghist = zeros(1, 256);
    for i = 1:h
        for j = 1:w
            imghist(img(i,j)+1) = imghist(img(i,j)+1) + 1; % ͳ�Ƹ����Ҷȳ���Ƶ��
        end
    end
    imghist = uint32(imghist);
    if show == 1 % ��ʾ�Ҷ�ֱ��ͼ
        figure; 
        bar(imghist);
        axis([0 255 0 3000]); % �Ҷ��᷶Χ0��255 
        title('�Ҷ�ֱ��ͼ');
        xlabel('�Ҷ�');
        ylabel('Ƶ��');
    end
    