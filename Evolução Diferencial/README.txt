/*******LAB 3 ************************/
	Computação evolucionária
	     prof. Cristiano
Alunos:

Bernardo Santos Suarez
Francis Carlos dos Santos
Victor Hugo

Algoritmo simples implementado evolução diferencial no matlab

função = [X,jX] = algoritmoED(fobj,lb,ub,N)

Argumentos de entrada
     fobj: nome da funcao objetivo a ser minimizada
     lb  : limites inferiores das variaveis de otimizacao
     ub  : limites superiores das variaveis de otimizacao
     N   : tamanho da populacao de solucoes
    
     Exemplos de execucao do algoritmo:
     [X,jX] = algoritmoED(@peaks,[-3 -3],[3 3],100);
     [X,jX] = algoritmoED(@rastrigin,[-2 -2],[2 2],100);
obs: o numero de variaveis de otimizacao e feita utilizando o tamanho do vetor de lb ou up.

Arquivos utilizados

algoritmoED.m
AvaliaFitness.m
plotar.m
peaks.m
rastrigin.m 