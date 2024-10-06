syms n;
x = (0.8) ^ n;
h = (-0.9) ^ n;
y1 = conv(double(subs(x, n, 0:25)), double(subs(h, n, 0:25)));
stem(-25:25, y1);
