clear;
close all;
clc;
% Declare the various variables used for distances
R = 250;
L = 2 * R;
speed = 1;
sample_time = 0.1;
step_distance = speed * sample_time;
g = 150;
min_distance = sqrt(g);
max_distance = L - sqrt(g);
d1 = min_distance:step_distance:max_distance;
d2 = L - d1;
d3 = abs(R - d1);
d4 = abs(R - d1);
Ns = length(d1);

th = -68;
hys = 5;

% pn = 2000; % for report
% pnth = 5000; % for report
pn = 100;
pnth = 100;
% Channel profile
[RSS1 , RSS2 , RSS3 , RSS4] = RSS();
plot(d1, RSS1,'r')
hold on
plot(d1, RSS2,'b')
hold on
plot(d1, RSS3,'g')
hold on
plot(d1, RSS4,'c')
title('RSS versus distance along route')
xlabel('distance from BS1 in meters');
ylabel('dBm');

%claculating PDFs
[probab , loc] = ProbabilityRSS(Ns , pn);
[probabth , locth] = ProbabilityRSSth(Ns , pn , th);
[probabhys , lochys] = ProbabilityRSShys(Ns , pnth , hys);
[probabthys , locthys] = ProbabilityRSSthys(Ns , pnth ,th, hys);
[c, n] = Count(probab);
[cth, nth] = Count(probabth);
[chys, nhys] = Count(probabhys);
[cthys, nthys] = Count(probabthys);

figure();
plot(n , c/pn);
title('Simple RSS : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
figure();
plot(d1 , loc/pn)
title('Simple RSS : (PDF) of hand off location')
grid on;


figure();
plot(nth , cth/pn);
grid on;
title('RSS with Threshold : (PDF) of number of handoffs')
xlabel('Number of handoffs')
ylabel('Probability')

figure();
plot(d1 , locth/pn)
title('RSS with Threshold : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')


figure();
plot(nhys , chys/pnth);
title('RSS with Hysteresis : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')

figure();
plot(d1 , lochys/pnth)
title('RSS with Hysteresis : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')

figure();
plot(nthys , cthys/pnth);
title('RSS with Threshold and Hysteresis : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')

figure();
plot(d1 , locthys/pnth)
title('RSS with Threshold and Hysteresis : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')


figure();
plot(n , c/pn , nth , cth/pn , nhys , chys/pnth , nthys , cthys/pnth)
title('(PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')
legend('Simple RSS' , 'RSS with threshold' , 'RSS with Hysteresis' , 'RSS with Threshold and Hysteresis')

figure();
plot(d1 , loc/pn, d1 , locth/pn , d1 , lochys/pnth , d1 , locthys/pnth)
title('(PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')
legend('Simple RSS' , 'RSS with threshold' , 'RSS with Hysteresis' , 'RSS with Threshold and Hysteresis')


%% Historgram
figure();
bar(n , c/pn);
title('Simple RSS : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
figure();
bar(d1 , loc/pn)
title('Simple RSS : (PDF) of hand off location')
grid on;


figure();
bar(nth , cth/pn);
grid on;
title('RSS with Threshold : (PDF) of number of handoffs')
xlabel('Number of handoffs')
ylabel('Probability')

figure();
bar(d1 , locth/pn)
title('RSS with Threshold : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')


figure();
bar(nhys , chys/pnth);
title('RSS with Hysteresis : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')

figure();
bar(d1 , lochys/pnth)
title('RSS with Hysteresis : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')

figure();
bar(nthys , cthys/pnth);
title('RSS with Threshold and Hysteresis : (PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')

figure();
bar(d1 , locthys/pnth)
title('RSS with Threshold and Hysteresis : (PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')


figure();
bar(n , c/pn)
hold on;
bar(nth , cth/pn)
hold on;
bar(nhys , chys/pnth)
hold on;
bar(nthys , cthys/pnth)
hold off;
title('(PDF) of number of handoffs')
grid on;
xlabel('Number of handoffs')
ylabel('Probability')
legend('Simple RSS' , 'RSS with threshold' , 'RSS with Hysteresis' , 'RSS with Threshold and Hysteresis')

figure();
bar(d1 , loc/pn)
hold on;
bar(d1 , locth/pn)
hold on ;
bar(d1 , lochys/pnth)
hold on;
bar(d1 , locthys/pnth)
hold off;
title('(PDF) of hand off location')
grid on;
xlabel('handoff location')
ylabel('Probability')
legend('Simple RSS' , 'RSS with threshold' , 'RSS with Hysteresis' , 'RSS with Threshold and Hysteresis')