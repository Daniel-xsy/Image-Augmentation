function imghist = histogram(img, show)
    [h, w] = size(img);
    imghist = zeros(1, 256);
    for i = 1:h
        for j = 1:w
            imghist(img(i,j)+1) = imghist(img(i,j)+1) + 1; % 统计各个灰度出现频次
        end
    end
    imghist = uint32(imghist);
    if show == 1 % 显示灰度直方图
        figure; 
        bar(imghist);
        axis([0 255 0 3000]); % 灰度轴范围0到255 
        title('灰度直方图');
        xlabel('灰度');
        ylabel('频数');
    end
    