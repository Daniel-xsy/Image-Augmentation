% 实现分离傅里叶变换，并将频谱原点移动至中心
function spectrum = dft(img)
    [h, w] = size(img);
    img = double(img);
    shift = zeros(h,w);
    for x=1:w
        for y=1:h
            shift(y,x) = (-1)^(x+y); % shift map取值
        end
    end
    img = img .* shift; % 频谱图原点转移至中心点
    v = (1:h)';
    y = 1:h;
    a = exp(-1j * 2 * pi * v * y / h);
    sum = 0;
    for i = 1:h
        sum = sum + a(1,i) * img(i,1);
    end
    spectrum = a * img / h; % 对行进行傅里叶变换

    Temp = spectrum; % 保存中间变量
    
    u = 1:w;
    x = (1:w)';
    spectrum = (Temp * exp(-1j * 2 * pi * x * u / w))/w; % 对列进行傅里叶变换
       