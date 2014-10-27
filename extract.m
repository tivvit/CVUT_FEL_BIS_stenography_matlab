function extract(image,key)
clc;    
close all; 

img = imread(image);
[height, width] = size(img);

%For this example the max size is 100 bytes, or 800 bits, (bytes * = bits
m = 800;
k = 1;
for i = 1 : height
    for j = 1 : width
        if (k <= m)
            b(k) = mod(double(img(i,j)),2);
            k = k + 1;
        end
    end
end
binaryVector = b;
binValues = [ 128 64 32 16 8 4 2 1 ];
binaryVector = binaryVector(:);
if mod(length(binaryVector),8) ~= 0
    error('Length of binary vector must be a multiple of 8.');
end
binMatrix = reshape(binaryVector,8,100);
%display(binMatrix);

for i=1:8:size(binMatrix,2),
    binstr = num2str(binMatrix(i:i+8));
    %strs = binstr(1:end)
    
    %e = i + 8;
    
    
    %bin = binstr(i:e);
    bin2dec(binstr)
end
%textString = char(binValues*binMatrix);    
%disp(textString);

%{
1)
2)
3) 
4) rand message length  
5) read message
6)
%}
end