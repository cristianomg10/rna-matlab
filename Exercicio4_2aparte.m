%
%
%
%
%
%
%

b = rand();
a = rand();
c = rand();

X = [0 : 0.1 : 10];
Yd = a*X + c + (rand(1, size(X, 2)) * 2 - 1);

plot(X, Yd, 'o');

W = rand(1, size(X,1)) * 2 - 1;

maxepocas = 30;
tol = 0;
alfa = 0.01;

[ W, b, erroEpoca] = treina_adaline(W,b,X,Yd,alfa,maxepocas,tol);

%plot(erroEpoca);
%title('SEQ x época');
%xlabel('Época');
%ylabel('SEQ');

%Gerar novo vetor X
Xs = [0 : 0.1 : 10];
Ys = yadaline(W, b, Xs);

hold on
plot(Xs, Ys, '-');
title('Geração de dados e aprendizado Adaline');
xlabel('X');
ylabel('Y');
legend({'Dados', 'Função aprendida'});