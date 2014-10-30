function embed(iFileName, message, key, oFileName)
clc;    
close all; 

%1) load image imread
img = imread(iFileName);
[height, width] = size(img);

msgLength = size(message, 1)
lengthLen = 4;
m = lengthLen * 8;
m = m + msgLength;  %bit cnt
pixels = height * width;
%imshow(img, []);

binaryLengthLen = dec2bin(m, lengthLen * 8);

%2) initiate PRNG
rng(key);

%3) random permute, same
rnd = randperm(pixels, pixels);
array = randi([0 1], 1, m);

%4) Encode message length
for i = 1:(lengthLen*8)
    
    h = mod(rnd(i),height) + 1;
    w = ceil(rnd(i)/width);
    imgChunk = img(w,h);
    
    if mod(imgChunk, 2) == 1
        if binaryLengthLen(i) == '0'
            if (array(i) == 1 || imgChunk == 0)
               img(w,h) = imgChunk + 1;
           else
               img(w,h) = imgChunk - 1;
            end
        end
    else
        if binaryLengthLen(i) == '1'
           if (array(i) == 1 || imgChunk == 0)
               img(w,h) = imgChunk + 1;
           else
               img(w,h) = imgChunk - 1;
           end
        end
    end
end
                  
%5) encode message           
for i = ((lengthLen * 8) + 1):m 
    
    h = mod(rnd(i), height) + 1;
    w = ceil(rnd(i)/width);
      
    imgChunk = img(w, h);
    
    if mod(imgChunk, 2) == 1
        if message(i - (lengthLen * 8),1) == 0
           if (array(i) == 1 || imgChunk == 0)
               img(w, h) = imgChunk + 1;
           else
               img(w, h) = imgChunk - 1;
           end
        end
    else
        if message(i - (lengthLen * 8),1) == 1
           if (array(i) == 1 || imgChunk == 0)
               img(w, h) = imgChunk + 1;
           else
               img(w, h) = imgChunk - 1;
           end
        end
    end
end

%6) imwrite
imwrite(img, oFileName)

end


