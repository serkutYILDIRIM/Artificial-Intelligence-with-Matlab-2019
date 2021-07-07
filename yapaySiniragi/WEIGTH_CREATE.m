function [w_1 b_1 w_2 b_2] = WEIGTH_CREATE(X, Y, g_Layer_Cell, n_X, n_Y)
w_1 = rand(g_Layer_Cell, n_X);
b_1 = rand(g_Layer_Cell, 1);
w_2 = rand(g_Layer_Cell, 1);
b_2 = rand(n_Y, 1);