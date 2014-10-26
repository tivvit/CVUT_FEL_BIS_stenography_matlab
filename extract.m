function extract(image,key)
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
%{
1)
2)
3) 
4) rand message length  
5) read message
6)
%}
end