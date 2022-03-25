function [dy] = funkcja(t, y)
  dy = [-3*y(2)^2 / 3; sin(t)^2 + y(1)];
end