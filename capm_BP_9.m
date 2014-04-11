% capm_BP_9.m

%clear
clear all
close all
clc

%Subir datos
dataFile = importdata('Portfolios_formed_on_BE-Me.txt')
factorsFile = importdata('FF_factors.txt')
[N_months,z] = size(dataFile.data)
%Datos

R_P = dataFile.data(:,2:end);   %matriz de N_months x 19
rf = factorsFile.data(:,5); %matriz de N_months x 1
R_M = factorsFile.data(:,2 ) + rf; %matriz de N_months x 1
X = R_M - rf ;%matriz de N_months x 1
Y = R_P(:,4) - rf ;%matriz de N_months x 1

% Correr regresion lineal
[r,m,b] = regression(X',Y')
% Otra regresion
X = [X,ones(N_months,1)];
[w,wint] = regress(Y,X)
m = w(1)
b = w(2)
mint = wint(1,:)
bint = wint(2,:)

% Plot de alpha con los portafolios Lo30, mid40 , High30






