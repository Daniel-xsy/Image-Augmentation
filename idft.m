% 实现分离傅里叶反变换
function img = idft(spectrum)
    [h, w] = size(spectrum);
    spectrum = double(spectrum);
    
    v = (1: h)';
    y = 1: h;
    img = exp(1j*2*pi*v*y/h)*spectrum; % 对行进行反傅里叶变换

    Temp = img; % 保存中间变量
    
    u = 1: w;
    x = (1: w)';
    img = Temp*exp(1j*2*pi*x*u/w); % 对列进行反傅里叶变换
    
    shift = zeros(h,w);
    for x=1:w
        for y=1:h
            shift(y,x) = (-1)^(x+y); % 计算shift map
        end
    end
    img = img.*shift; % 还原原始图片