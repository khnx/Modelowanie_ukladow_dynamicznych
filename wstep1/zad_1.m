clc;clear;close all;

% The number of the group.
W = 4;

% The Matrix.
% Coefficients.
A = [
    1 - W,    2+W,   3;
    5 - W/2,  6,     7 + W/2;
    8,        9 - W, 10 + W/2
];
% Values.
B = [
    3 + W/2;
    6;
    9 - W/2
];

% Reference.
C = linsolve(A, B);

% Merge matrices A and B.
M = zeros(3,4);

for ii=1:3
    M(ii,1:3) = A(ii, :);
end
M(:,4) = B;

% Make REF.
M(2,:) = M(2,:) - M(1,:) * (M(2,1) / M(1,1));
M(3,:) = M(3,:) - M(1,:) * (M(3,1) / M(1,1));
M(3,:) = M(3,:) - M(2,:) * (M(3,2) / M(2,2));
M(1,:) = M(1,:) / M(1,1);
M(2,:) = M(2,:) / M(2,2);
M(3,:) = M(3,:) / M(3,3);
% Reduce REF.
M(2,:) = M(2,:) - M(3,:) * (M(2,3) / M(3,3));
M(1,:) = M(1,:) - M(2,:) * (M(1,2) / M(2,2));
M(1,:) = M(1,:) - M(3,:) * (M(1,3) / M(3,3));

% Display the results.
disp('Our results:');
disp(M(:,4));
disp('Reference by linsolve(A, B):');
disp(C);
