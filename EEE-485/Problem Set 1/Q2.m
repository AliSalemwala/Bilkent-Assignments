mu = zeros (3, 100);
var = zeros (3, 100);

for i = 1: 100
[Y100, Y1000, Y10000] = makeSeq (0.5, 0.3);
mu(1, i) = sum (Y100) / 100;
mu(2, i) = sum (Y1000) / 1000;
mu(3, i) = sum (Y10000) / 10000;

var(1, i) = sum ((Y100 - mu(1, i)).^2) / 99;
var(2, i) = sum ((Y1000 - mu(2, i)).^2) / 999;
var(3, i) = sum ((Y10000 - mu(3, i)).^2) / 9999;
end
n = 1 : 100;
figure;
plot (n, mu(1,:), 'g', n, mu(2,:), 'b', n, mu(3,:), 'r');
hold;
title ('Sample Mean');
title (legend ('100', '1000', '10000'), 'Sample Size');
xlabel ('Experiment Number');
ylabel ('Sample Mean');
figure;
plot (n, var(1,:), 'g', n, var(2,:), 'b', n, var(3,:), 'r');
hold;
title ('Sample Variance');
title (legend ('100', '1000', '10000'), 'Sample Size');
xlabel ('Experiment Number');
ylabel ('Sample Variance');

function [Y100, Y1000, Y10000] = makeSeq(mu, sd)
Y100 = zeros (1, 100);
Y1000 = zeros (1, 1000);
Y10000 = zeros (1, 10000);

for n = 1: 100
    Y100(n) = normrnd (mu, sd);
end

for n = 1: 1000
    Y1000(n) = normrnd (mu, sd);
end

for n = 1: 10000
    Y10000(n) = normrnd (mu, sd);
end
end