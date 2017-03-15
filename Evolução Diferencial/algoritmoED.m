%**************************************************************************
%  Laboratório 3 
%  Alunos: Bernardo Suarez
%          Francis Carlos dos Santos
%          Victor Hugo Gonçalves
% *************************************************************************
function [X,jX] = algoritmoED(fobj,lb,ub,N)

% fobj: nome da funcao objetivo a ser minimizada
% lb  : limites inferiores das variaveis de otimizacao
% ub  : limites superiores das variaveis de otimizacao
% N   : tamanho da populacao de solucoes

t = 1;              % geracao atual
tmax = 100;         % numero maximo de geracoes
F = 0.7;            % Fator de escala
C = 0.9;            % Probabilidade de cruzamento
n = length(lb);     % numero de variaveis

% Populacao inicial
X = (repmat(ub(:),1,N)-repmat(lb(:),1,N)).*rand(n,N) + repmat(lb(:),1,N);
% Avaliacao das solucoes candidatas
jX = AvaliaFitness(fobj,X);

while ( t <= tmax )% Critério de parada
    % Mutacao diferencial
    V = zeros(n,N);
    J = randperm(N);
    for i = 1:N
        j = randperm(N);
        while ( sum(J(i) == j(1:3)) > 0 )
            j = randperm(N);
        end
        V(:,i) = X(:,j(1)) + F*(X(:,j(2))-X(:,j(3)));
    end
    % Recombinacao discreta
    for i = 1:N
        delta(i) = randperm(n,1);
        for j = 1:n
            if ( unifrnd(0,1) <= C || j == delta(i) )
                U(j,i) = V(j,i);
            else
                U(j,i) = X(j,i);
            end
        end
    end
    % Selecao para sobrevivencia
    for i = 1:N
        if ( feval(fobj, U(:,i)) <= feval(fobj, X(:,i)) )
            X(:,i) = U(:,i);
        else
            X(:,i) = X(:,i);
        end
    end
    % Avalia Fitness
    jX = AvaliaFitness(fobj,X);
    plotar(fobj,lb,ub,t,X,jX);
    t = t + 1;
    
end
end
