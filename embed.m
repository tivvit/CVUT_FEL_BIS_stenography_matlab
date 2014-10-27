function embed(iFileName,message,key,oFileName)
clc;    
close all; 

%1) load image imread
img = imread(iFileName);
[height, width] = size(img);

message
msgLength = floor(log10(message)) + 1;
m = msgLength * 8;

%{
AsciiCode = uint8(message); 
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1); %b is a vector of bits
%}

imshow(img, []);

%2) initiate PRNG
%generation of the random message
%rng(1);
%message=round(rand(msgLength,1));

%3) random permute, same
%{
AsciiCode = uint8(message); 
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
%}
b = zeros(m,1); %b is a vector of bits


%4) Encode message length
%s = c;
s=img;
k = 1; Array=[];l=1;my=1;
                  
%5) encode message
for i = 1 : height
  for j = 1 : width
       LSB = mod(double(img(i,j)), 2);
       if (k>m || LSB == b(k))
          s(i,j) = img(i,j);
          l=k+1;
      else 
          if(LSB == 1)
              s(i,j) = img(i,j) - 1;
          else
              s(i,j) = img(i,j) + 1;
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


