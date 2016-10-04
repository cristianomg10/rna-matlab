% Algoritmo de treinamento de perceptron Adaline
% Autor: Cristiano Garcia
% Data: 23/06/2016
% Par�metros:
%   W = pesos (1 x k)
%   b = bias (1x1)
%   X = dados de entrada (k x m)
%   Yd = sa�da desejada (1 x m)
%   alfa = taxa de aprendizado
%   maxepocas = maximo de epocas para treinamento
%   tol = tolerancia

function [ w, b, erroEpoca] = treina_adaline(W,b,X,Yd,alfa,maxepocas,tol)
    t = 1; % epoca
    erro = 1; %apenas para entrar no while
    w = W;
    erroEpoca = [];
    
    while (t < maxepocas) && (erro > tol)
        erro = 0;    
        for i = 1:length(X(1, :))
            y = yadaline(w, b, X(:, i));
            e = Yd(i) - y;
            w = w + alfa * e * X(:, i)';
            b = b + alfa * e;
            erro = erro + e^2;
        end
        erroEpoca(t) = erro;
        t = t+1;
    end
end

