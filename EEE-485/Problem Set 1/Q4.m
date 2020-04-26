load ('PS1train.mat');
load ('PS1test.mat');

test_errors = zeros (10, 1);
train_errors = zeros (10, 1);

for i = 1:10
    [x, coef] = train (PS1train, i);
    train_errors (i) = sum (((x * coef) - PS1train(:, 2)) .^ 2);
    
    x = zeros (50, i + 1);
    for j = 1:(i + 1)
        x (:, j) = (PS1test (:, 1).^ (j - 1));
    end
    test_errors (i) = sum (((x * coef) - PS1test(:, 2)) .^ 2);
end

n = 1:10;
plot (n, train_errors, 'b', n, test_errors, 'r');
hold;
legend ('RSS Train', 'RSS Test');
xlabel ('p');
ylabel ('RSS');

p = 3;
[y, coef] = train (PS1train, p);
x = zeros (1, p + 1);
for j = 1: (p + 1)
    x (:, j) = 5 ^ (j - 1);
end
disp (x * coef);

function [x, coef] = train (data, p)
x = zeros (50, p + 1);
for j = 1:(p + 1)
    x (:, j) = (data (:, 1).^ (j - 1));
end
coef = ((inv (transpose (x) * x)) * transpose (x)) * data(:, 2);
end