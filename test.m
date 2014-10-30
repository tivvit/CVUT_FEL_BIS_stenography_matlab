message=round(rand(5,1));
embed('Lena.png', message, 1, 'out.png');
out = extract('out.png',1);

fprintf('%s', message == out)