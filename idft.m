% ʵ�ַ��븵��Ҷ���任
function img = idft(spectrum)
    [h, w] = size(spectrum);
    spectrum = double(spectrum);
    
    v = (1: h)';
    y = 1: h;
    img = exp(1j*2*pi*v*y/h)*spectrum; % ���н��з�����Ҷ�任

    Temp = img; % �����м����
    
    u = 1: w;
    x = (1: w)';
    img = Temp*exp(1j*2*pi*x*u/w); % ���н��з�����Ҷ�任
    
    shift = zeros(h,w);
    for x=1:w
        for y=1:h
            shift(y,x) = (-1)^(x+y); % ����shift map
        end
    end
    img = img.*shift; % ��ԭԭʼͼƬ