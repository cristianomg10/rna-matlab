% Algoritmo de plotagem de reta
% Autor: Cristiano Garcia
% Data: 17/06/2016
% Par�metros:
%   W = Vetor de pesos (1 x m)
%   b = bias
%   intervalo = intervalo pra ser exibido no gr�fico

function [] = plotareta( W, b, intervalo )
    x1 = [intervalo(1) : 0.1 : intervalo(2)]; 
    x2 = - W(1) * x1/W(2) - b/W(2);

    plot(x1, x2);
end
