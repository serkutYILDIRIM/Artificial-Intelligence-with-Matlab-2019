function [w_1 b_1 w_2 b_2] = PARAM_UPDATE(w_1, b_1, w_2, b_2,...
d_w_1, d_b_1, d_w_2, d_b_2, g_L)
w_1 = w_1 + g_L * d_w_1;
w_2 = w_2 + g_L * d_w_2;
b_1 = b_1 + g_L * d_b_1;
b_2 = b_2 + g_L * d_b_2;