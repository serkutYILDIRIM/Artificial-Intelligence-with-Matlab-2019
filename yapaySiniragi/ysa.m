clc, clear all, close all;
g_In = 2;
g_X = 100;
UPPER_LIMIT = 1;
LOWER_LIMIT = -1;
X = INPUT_SET(g_X, g_In, UPPER_LIMIT, LOWER_LIMIT)
Y = SQUARE_SUM_EQ(X)
figure, plot3(X(1, :), X(2, :), Y, 'o')
%axis([ LOWER_LIMIT UPPER_LIMIT min(Y) max(Y)])
xlabel('X')
ylabel('X')
zlabel('Y')
grid on;
%% Agýrlýklar oluþturuldu
g_Layer_Cell = 5;
[n_X n_Samples] = size(X);
[n_Y n_Samples] = size(Y);
[w_1 b_1 w_2 b_2] = WEIGTH_CREATE(X, Y, g_Layer_Cell, n_X, n_Y);
g_L = 0.5;
g_ITER = 5000;
E_n = zeros(1, g_ITER);
for n_i = 1 : g_ITER
for n_j = 1 : n_Samples
[ol_out hl_out] = MLP(X(:, n_j), w_1, b_1, w_2, b_2);
[error E_n(n_i)] = FITNESS_VALUE(E_n(n_i), Y(:, n_j), ol_out);
[d_w_1 d_b_1 d_w_2 d_b_2] = BACK_PROPAGATION(X(:, n_j), w_2, hl_out, error);
[w_1 b_1 w_2 b_2] = PARAM_UPDATE(w_1, b_1, w_2, b_2,...
d_w_1, d_b_1, d_w_2, d_b_2, g_L);
end
end
figure, plot(E_n)
X_TEST = 2 * rand(n_X, g_X) - 1;
Y_TEST = SQUARE_SUM_EQ(X_TEST)
[n_X n_Samples] = size(X_TEST);
[n_Y n_Samples] = size(Y_TEST);
E_n_t = 0;
for n_j = 1 : n_Samples
[ol_out(n_j) hl_out] = MLP(X_TEST(:, n_j), w_1, b_1, w_2, b_2);
[error_t(n_j) E_n_t] = FITNESS_VALUE(E_n_t, Y_TEST(n_j), ol_out(n_j));
end
figure, plot3(X_TEST(1, :), X_TEST(2, :), Y_TEST, 'ro')
hold on;
plot3(X_TEST(1, :), X_TEST(2, :), ol_out, 'bo')
%axis([ LOWER_LIMIT UPPER_LIMIT min(Y) max(Y)])
xlabel('X')
ylabel('X')
zlabel('Y')
grid on;
figure, plot(error_t)
xlabel('X')
ylabel('Error')