function [message] = extract(image, key)
clc;    
close all; 

%1) load image imread
img = imread(image);
[height, width] = size(img);
lengthLen = 4;
pixels = height * width;

%2) initiate PRNG
rng(key);

%3) random permute, same
rnd = randperm(pixels, pixels);
l = dec2bin(0, lengthLen * 8);

%4) Decode message length
for i = 1:(lengthLen * 8)
    
    h = mod(rnd(i), height) + 1;
    w = floor(rnd(i)/width) + 1;
    imgChunk = img(w, h);
    
    if mod(imgChunk, 2) == 1
        l(i) = '1';
    else
        l(i) = '0';
    end
end

len = bin2dec(l) - (lengthLen * 8)

%5) Decode message
message = dec2bin(0, len);

for i = (lengthLen * 8) + 1:len + (lengthLen * 8)
    
    h = mod(rnd(i), height) + 1;
    w = floor(rnd(i) / width) + 1;
    
    %{
    if(w > width)
        w = width
    end
    }
    imgChunk = img(w, h);
    
    if mod(imgChunk, 2) == 1
        message(i - (lengthLen * 8)) = '1';
    else
        message(i - (lengthLen * 8)) = '0';
    end
end

%{
for i = 1:(len/8)
    tmp = dec2bin(0, 8);
    
    for j = 1:8
        tmp(j) = m((i-1) * 8 + j);
    end
    
    message(i, 1) = double(bin2dec(tmp));
end
%}

%message = transpose([char(message)]);
end