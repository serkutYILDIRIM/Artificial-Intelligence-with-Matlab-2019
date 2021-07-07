function [ol_out hl_out] = MLP(X, w_1, b_1, w_2, b_2)
hl_sum = w_1 * X + b_1;
hl_out = logsig(hl_sum);
ol_out = hl_out' * w_2 +b_2;