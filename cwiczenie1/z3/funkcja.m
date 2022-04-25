function [dy] = funkcja(t, y)
  dy = [y(2); sin(t/2) + cos(t/2) - y(1)];
end