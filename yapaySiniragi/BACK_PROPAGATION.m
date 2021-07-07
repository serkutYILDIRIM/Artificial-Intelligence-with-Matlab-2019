function [d_w_1 d_b_1 d_w_2 d_b_2]= BACK_PROPAGATION(X, w_2, hl_out, error)
d_b_2 = error;
d_w_2 = error * hl_out;
s = error * w_2 .* hl_out .* (1- hl_out);
d_b_1 = s;
d_w_1 = s * X';