function [error E_n] = FITNESS_VALUE(E_n, Outputs, ol_out)
error = Outputs - ol_out;
E_n = E_n + error^2/2;