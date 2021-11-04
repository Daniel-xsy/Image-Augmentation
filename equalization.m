function new_img = equalization(hist, img)
    [h, w] = size(img);
    total_s = h * w;
    hist = double(hist) / total_s; % ����Ҷȼ�����
    new_hist = zeros(1, 256);
    new_img = zeros(h, w);
    for i=1:256
        temp = sum(hist(1:i));  % ǰi���Ҷȼ������ۼ�
        new_hist(i) = 255 * temp + 0.5; % ������ֱ��ͼ�Ҷ�
    end
    for i = 1: h
        for j = 1: w
            new_img(i,j) = new_hist(img(i,j)+1); % +1 ��1��ʼ����
        end
    end