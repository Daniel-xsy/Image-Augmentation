function img_out = homofilter(img, D0, n)
    [h, w] = size(img);
    filter = zeros(h, w); % �����˲���
    log_img = log(double(img + 1)); % ����� +1 ������� ln0
    spectrum = dft(log_img); % �õ�Ƶ��ͼ
    
    center_h = h / 2;
    center_w = w / 2;
    % ���������˹��ͨ�˲��� ƫ����Ϊ2
    for i = 1: h
        for j= 1: w
            D = sqrt((i-center_h)^2 + (j-center_w)^2);
            filter(i,j) = 1 / (1 + (D0 / D)^(2 * n)) + 2; 
        end
    end
    % �˲�����
    imshow(filter,[]);
    spectrum = spectrum .* filter;
    log_img_ft = idft(spectrum);
    img_out = exp(log_img_ft) - 1;