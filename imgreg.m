clc;
clear all;
close all;

g = [1 1 1 1 1 1;
    1 20 2 2 2 1;
    1 2 3 3 2 1;
    1 2 3 3 2 1;
    1 2 2 2 2 1;
    1 1 1 1 1 1];

g1 = [zeros(size(g,1),1) g zeros(size(g,1),1)]';
g2 = [zeros(size(g1,1),1) g1 zeros(size(g1,1),1)]';

norm = zeros(size(g2,1), size(g2,2));
cc = norm;

cc_norm = norm;

for i=2:1:(size(g2,1)-1)
    for j=2:1:(size(g2,2)-1)
        cc(i,j) = 3*g2(i-1,j-1)+3*g2(i-1,j)+2*g2(i-1,j+1)+3*g2(i,j-1)+3*g2(i,j)+2*g2(i,j+1)+2*g2(i+1,j-1)+2*g2(i+1,j)+2*g2(i+1,j+1)
        norm(i,j) = sqrt(g2(i-1,j-1)^2+g2(i-1,j)^2+g2(i-1,j+1)^2+g2(i,j-1)^2+g2(i,j)^2+g2(i,j+1)^2+g2(i+1,j-1)^2+g2(i+1,j)^2+g2(i+1,j+1)^2);
        cc_norm(i,j) = cc(i,j)/norm(i,j);
    end
end

cc_norm(2:1:end-1,2:1:end-1)
r = rand