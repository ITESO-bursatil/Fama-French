% capm_BP_11.m

clear all
close all
clc

%importdata
portfolioFile = importdata('portfolios_BP.txt')
factorsFile = importdata('FF_factors.txt')
R_P = portfolioFile.data(:,2:end);
factors = factorsFile.data(:,2:end);

%calcular

R_M = factors(:,1)+factors(:,4);  % una matriz de N_months x 1
rf =  factors(:,4) ;  % una matriz de N_months x 1
R_High30 = R_P(:,4); % una matriz de N_months x 1

%
X = R_M - rf ;
Y = R_High30 - rf ;

% Corremos regresion lineal
[r,m,b] = regression(X',Y')

% Regresion lineal con intervalos
X = [X ones(length(X),1)];
[w,wint] = regress(Y,X)
m = w(1)
b = w(2)
mint = wint(1,:)
bint = wint(2,:)






