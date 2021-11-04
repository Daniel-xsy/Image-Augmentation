% ʵ�ַ��븵��Ҷ�任������Ƶ��ԭ���ƶ�������
function spectrum = dft(img)
    [h, w] = size(img);
    img = double(img);
    shift = zeros(h,w);
    for x=1:w
        for y=1:h
            shift(y,x) = (-1)^(x+y); % shift mapȡֵ
        end
    end
    img = img .* shift; % Ƶ��ͼԭ��ת�������ĵ�
    v = (1:h)';
    y = 1:h;
    a = exp(-1j * 2 * pi * v * y / h);
    sum = 0;
    for i = 1:h
        sum = sum + a(1,i) * img(i,1);
    end
    spectrum = a * img / h; % ���н��и���Ҷ�任

    Temp = spectrum; % �����м����
    
    u = 1:w;
    x = (1:w)';
    spectrum = (Temp * exp(-1j * 2 * pi * x * u / w))/w; % ���н��и���Ҷ�任
       