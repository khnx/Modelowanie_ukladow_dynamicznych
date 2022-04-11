function [dy] = funkcja(t,y)
  dy = [y(2); 4*sin(t) + 5*cos(2*t) + y(1)];
end