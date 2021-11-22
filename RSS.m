function [RSS1 , RSS2 , RSS3 , RSS4] = RSS()
R = 250;
L = 2 * R;
speed = 1;
sample_time = 0.1;
step_distance = speed * sample_time;
g = 150;
min_distance = sqrt(g);
max_distance = L - sqrt(g);
d1 = [min_distance:step_distance:max_distance];
d2 = L - d1;
d3 = abs(R - d1);
d4 = abs(R - d1);
Ns = length(d1);
% Declare variables and compute RSS
% Part 1: Computations independant of the random variable
% for shadow fading
Pt = 20;
Po = 38;
grad1 = 2;
grad2 = 2;
alpha = exp(-1/85);
sigma1 = sqrt(8);
sigma2 = sqrt(sigma1^2 * (1 - alpha^2));
RSS01 = Pt - Po - (10 * grad1 * log10(d1) + 10 * grad2 * log10(d1/g));
RSS02 = Pt - Po - (10 * grad1 * log10(d2) + 10 * grad2 * log10(d2/g));
RSS_corner = Pt - Po - (10 * grad1 * log10(R) + 10 * grad2 *log10(R/g));

RSS03 = RSS_corner - (10 * grad1 * log10(d3) + 10 * grad2 *log10(d3/g));

RSS04 = RSS_corner - (10 * grad1 * log10(d4) + 10 * grad2 *log10(d4/g));
for i=1:Ns
 if d3(i) < min_distance
 RSS03(i) = RSS_corner;
 end
 if d4(i) < min_distance
 RSS04(i) = RSS_corner;
 end
end
% Part 2: Adding the random variable for shadow fading
s1(1) = sigma1 * randn(1);
s2(1) = sigma1 * randn(1);
s3(1) = sigma1 * randn(1);
s4(1) = sigma1 * randn(1);
for i=2:Ns
 s1(i) = alpha * s1(i-1) + sigma2 * randn(1);
 s2(i) = alpha * s2(i-1) + sigma2 * randn(1);
 s3(i) = alpha * s3(i-1) + sigma2 * randn(1);
 s4(i) = alpha * s4(i-1) + sigma2 * randn(1);
end
RSS1 = RSS01 + s1;
RSS2 = RSS02 + s2;
RSS3 = RSS03 + s3;
RSS4 = RSS04 + s4;
end