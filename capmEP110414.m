%capmEP11042014

%Clear
clear all
close all
clc

%Subir datos
datafile = importdata('portfolios_EP.txt');
[N_months,z]= size(datafile.data);
factorsfile = importdata('factores.txt');

%Si queremos como matriz tenemos que poner el nombre de la variable en este
%caso datafile y le ponemos terminacion ".data"
%Si queremos que nos de los encabezados se lo debemos de pedir cobn la
%terminacion de ".colheaders"

%Datos

R_P= datafile.data(:,2:end); %Matriz de N_months x 19
rf= factorsfile.data(:,5); %Matriz de N_months x1
R_M = factorsfile.data(:,2)+rf; %Matriz de N_months x1
X = R_M - rf; %Matriz de N_months x 1
YLo30 = R_P(:,2) - rf; %Matriz de N_months x 1, portafolio Lo30
YMid40 = R_P(:,3) - rf; %Matriz de N_months x 1, portafolio Mid40
YHigh30 = R_P(:,4) - rf; %Matriz de N_months x 1, portafolio Mid40


%Regresion
X= [X,ones(N_months,1)]; %Si se usa esta regresion recordar que se le debe
%agregar una columna de unos, esta regreson te da intervalos de confianza
[wLo30,wintLo30] = regress(YLo30,X)
mLo30 = wLo30(1)
bLo30 = wLo30(2)
mintLo30 = wintLo30(1,:)
bintLo30 = wintLo30(2,:)

[wMid40,wintMid40] = regress(YMid40,X)
mMid40 = wMid40(1)
bMid40 = wMid40(2)
mintMid40 = wintMid40(1,:)
bintMid40 = wintMid40(2,:)

[wHigh30,wintHigh30] = regress(YHigh30,X)
mHigh30 = wHigh30(1)
bHigh30 = wHigh30(2)
mintHigh30 = wintHigh30(1,:)
bintHigh30 = wintHigh30(2,:)

% Plot de alpha con los portafolios Lo30, mid40, High30