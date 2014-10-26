function embed(iFileName,message,key,oFileName)
clc;    
close all; 
clear all; 

%1) load image imread
i = imread('Lena.png');
[height, width] = size(i);

%msgLength = length(message) * 8;

%{
AsciiCode = uint8(message); 
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1); %b is a vector of bits
%}

imshow(i, []);

%2) initiate PRNG
%generation of the random message
rng(1);
message=round(rand(msgLength,1));

%3) random permute, same
AsciiCode = uint8(message); 
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1); %b is a vector of bits

%4) Encode message length
s = c;
height = size(c,1);
width = size(c,2);
k = 1; Array=[];l=1;my=1;
                  
%5) encode message
for i = 1 : height
  for j = 1 : width
       LSB = mod(double(c(i,j)), 2);
       if (k>m || LSB == b(k))
          s(i,j) = c(i,j);
          l=k+1;
      else 
          if(LSB == 1)
              s(i,j) = c(i,j) - 1;
          else
              s(i,j) = c(i,j) + 1;
      Array(my)=l;
      l=l+1;
      my= my + 1;
      end
      k = k + 1;
      end
  end
end

%6) imwrite
imwrite(s, oFileName)

end

