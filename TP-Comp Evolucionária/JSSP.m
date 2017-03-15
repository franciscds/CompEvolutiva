function [ makespan, sequence, avg_fit, best_fit ] = JSSP( filename )

N = 200; %Tamanho da populaçao
n = 3;   %numero de maquinas
maxIt = 300;
chancedeCruzamento = 0.7;
chancedeMutacao = 0.1;
g = 1;
repete =15;
maquina = criaEstrutura(3);
jobs = dlmread(filename);
[nJobs,nColunas] = size(jobs);
geracao(g) = g;
parents = criaPop(N,nJobs); %inicializa População
offspring = zeros(N,nJobs);

%avalia fitness
makespan = AvaliaFitness(maquina,jobs,parents);
[best_fit(g),indice] = min(makespan(:));
avg_fit(g) = mean(makespan);
while( g < maxIt || repete == 15)
    
    somaFitness = sum(makespan);
    vetorProb = makespan./somaFitness;
    cumProb = cumsum(vetorProb);
    
    for i=1:N
        %escolhe pais pra cruzamento
        [~,p1] = histc(min(rand(),0.999999999),cumProb);
        [~,p2] = histc(min(rand(),0.999999999),cumProb);
        %crossover de 1 ponto
        if(p1==0)
            p1 = randi([1 N],1,1);
        end
        if(p2==0)
            p2 = randi([1 N],1,1);
        end
        if chancedeCruzamento > rand(1,1),
            
            pontoDeCruzamento = randi([2 nJobs-1],1,1);
            offspring(i,1:pontoDeCruzamento) = parents(p1,1:pontoDeCruzamento);
            for j=pontoDeCruzamento+1:nJobs
                if ismember(parents(p2,1:j),offspring(i,:))
                    continue;
                else
                    offspring(i,1:j) = parents(p2,1:j);
                end
                    
            end
%             offspring(i,pontoDeCruzamento+1:end) = parents(p2,pontoDeCruzamento+1:end);
        else
            if chancedeCruzamento > 0.5
                offspring(i,1:nJobs) = parents(p1,:);
            else
                offspring(i,1:nJobs) = parents(p2,:);
            end
        end
    end
    %Avalia Mutação
    for i=1:N
        if chancedeMutacao > rand(1,1)
            
            %seleciona cromossomo para mutar
            pos1 = randperm(nJobs,1);
            pos2 = randperm(nJobs,1);
            temp =  offspring( i,pos1);
            offspring( i,pos1) = offspring( i,pos2);
            offspring( i,pos2) = temp;
        end
    end
    parents = offspring;
    %avalia Melhor
    makespan = AvaliaFitness(maquina,jobs,parents);
    
    g = g+1;
    geracao(g) = g;
    %Recebe Melhor fitness
    [best_fit(g),indice] = min(makespan);
    %Recebe fitness Medio
    avg_fit(g) = mean(makespan(:));
    
    if best_fit(g) == best_fit(g-1)
        repete = repete-1;
    else
        repete = 0;
    end
    
end
sequence = parents(indice,:);
parents(indice,:);

%plota Saida
figure(1)
plot(geracao,best_fit,'b.',geracao, avg_fit,'r.');
titleSstring = sprintf('JSSP');
title(titleSstring);
xlabel('Iterações');
ylabel('Fitness');
legend('Melhor Fitness','Fitness Medio')

end