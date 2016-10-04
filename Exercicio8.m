clear all;
close all;
clc;

nc  = 5;
npc = [ 100  100  100 100 100];
mc  = [ 4  0  0  4  8 
        5  0  5  0  0
      ];
  
varc =[ 1  1  1 1 1 
        1  1  1 1 1
      ];
 
total = sum(npc);  
  
% a - crie v�rias amostras de dados de duas dimens�es divididas em 5 
% classes n�o linearmente separ�veis; utilize a fun��o geragauss j� criada;
[X, C] = geragauss( nc, npc, mc, varc );

% j - repita 10 vezes o procedimento a partir do item b, de modo a 
% calcular a m�dia e desvio padr�o do resultado final;
times = 10;

for i=1:times
    % b - embaralhe os dados criados; utilize a fun��o mistura j� criada;
    [X, C] = mistura(X, C);

    % c - plote os dados criados; utilize a fun��o plotadc2d j� criada;
    figure;
    hold on
    plotadc2d(X, C);

    % e - separe os dados em dois conjuntos: 
    % treinamento (80%) e teste (20%);
    treinamento     = X(:, 1:(total * 0.8)); % 80% para treinamento
    ctreinamento    = C(:, 1:(total * 0.8));
    teste           = X(:, (total * 0.8 + 1):total); % 20% para teste
    cteste          = C(:, (total * 0.8 + 1):total);

    figure
    hold on
    % f - plote os dados separados em treinamento e teste (2 gr�ficos 
    % separados); utilize a fun��o plotadc2d e convbindec j� desenvolvidas;
    plotadc2d(treinamento, ctreinamento);
    
    figure
    hold on
    plotadc2d(teste, cteste);

    % d - crie a matriz de classifica��o bin�ria (sa�da desejada);
    % utilize a fun��o convdecbin j� desenvolvida;
    ctreinamento = converte_dec_bin(ctreinamento);
    cteste = converte_dec_bin(cteste);

    % g - crie uma rede neural tipo MLP e treine com o conjunto de dados de 
    % treinamento; utilize as fun��es do toolbox ANN do MATLAB;
    net = feedforwardnet([10 10 10]);
    [net, tr] = train(net, treinamento, ctreinamento);
    Ys = sim (net, teste);

    % i - reclassifique os dados do conjunto de treinamento e teste 
    % utilizando a RNA treinada (utilize o toolbox) e contabilize o n�mero 
    % de acertos (resposta em porcentagem de acertos separado 
    % para treinamento e teste);
    Yt = sim (net, treinamento);
    Ct = round(Yt) == ctreinamento;
    Et(i) = sum(sum(Ct)) / total / 100;
    
    Ytt = sim(net, teste);
    Ctt = round(Ytt) == cteste;
    Ett(i) = sum(sum(Ctt)) / total / 100;
end
    
% h - plote o erro m�dio quadr�tico de treinamento por �poca;
plotperform(tr);

media_Et  = mean(Et); 
media_Ett = mean(Ett);

std_Et = std(Et);
std_Ett = std(Ett);

% l - plote os dados de treinamento e teste reclassificados pela RNA 
% (gr�ficos separados) e compare, graficamente, com a classifica��o 
% original.
figure
hold on
plotadc2d(teste, converte_bin_dec(round(Ys)));

figure 
hold on
plotadc2d(treinamento, converte_bin_dec(round(Yt)));

