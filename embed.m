function embed(iFileName, message, key, oFileName)
clc;    
close all; 

%1) load image imread
img = imread(iFileName);
[height, width] = size(img);

msgLength = size(message, 1);
lengthLen = 8;
m = lengthLen + msgLength;
m = m * 8; %bit cnt
pixels = height * width;
%imshow(img, []);

binaryLengthLen = dec2bin(m, lengthLen * 8);
binaryMessage = dec2bin(message);

%2) initiate PRNG
%rng(key)
randn('seed', key)

%3) random permute, same
rand = randperm(pixels);
array = randi([0 1], 1, m);

%4) Encode message length
for i = 1:(lengthLen*8)
    
    h = mod(rand(i),height) + 1;
    w = floor(rand(i)/width) + 1;
    imgChunk = img(w,h,1);
    
    if mod(imgChunk, 2) == 1
        if binaryLengthLen(i) == '0'
            if (array(i) == 1  && imgChunk ~= 255 ) || imgChunk == 0
               imgChunk = imgChunk + 1;
           else
               imgChunk = imgChunk - 1;
            end
        end
    else
        if binaryLengthLen(i) == '1'
           if (array(i) == 1  && imgChunk ~= 255 ) || imgChunk == 0
               imgChunk = imgChunk + 1;
           else
               imgChunk = imgChunk - 1;
           end
        end
    end
end
                  
%5) encode message           
y = 0; x = 0;

for i = (lengthLen * 8) + 1:m 
    y = mod(y, 8) + 1;
    
    if x == 1
        x = x + 1;
    end
    
    h = mod(random(i), height) + 1;
    w = floor(rand(i)/width) + 1;
    imgChunk = img(w, h, 1);
    
    if mod(imgChunk, 2) == 1
        if binaryMessage(x,y) == '0'
           if (array(i) == 1  && imgChunk ~= 255 ) || imgChunk == 0
               imgChunk = imgChunk + 1;
           else
               imgChunk = imgChunk - 1;
           end
        end
    else
        if binaryMessage(x,y) == '1'
           if (array(i) == 1  && imgChunk ~= 255 ) || img(w,h,1) == 0
               imgChunk = imgChunk + 1;
           else
               imgChunk = imgChunk - 1;
           end
        end
    end
end

%6) imwrite
imwrite(img, oFileName)

end


