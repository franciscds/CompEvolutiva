function GAmochila()
clc;
    n = 20; %numero de familiares iniciais
    maxIter = 1000;
    peso = [10 18 12 14 13 11 8 6];
    valor= [5 8 7 6 9 5 4 3];
    capacidade = 35;
    chancedeCruzamento = 0.8;
    probMutacao = 0.1;
    %cumsum***  
  
    parents = criaPop(n);
    fitness = zeros(n,1);
    count = 1;
    filhos = zeros(n,8);
      for i=1:n
        fitness(i,1) = fitness_ksp(parents(i,:),valor,peso,capacidade);
      end
    melhorSolucao = max(fitness);
    while( count < maxIter || melhorSolucao == 35 )
        
  
    
         somaFitness = sum(fitness);
        vetorProb = fitness./somaFitness;
        cumProb = cumsum(vetorProb);
    for i=1:n
        %escolhe pais pra cruzamento
        [~,p1] = histc(min(rand(),0.999999999),cumProb);
        [~,p2] = histc(min(rand(),0.999999999),cumProb);
        %crossover de 1 ponto
        if(p1==0)
            p1 = randi([1 20],1,1);
        end
       if(p2==0)
           p2 = randi([1 20],1,1);
       end
        if chancedeCruzamento > rand(1,1),

            pontoDeCruzamento = randi([2 7],1,1);
            filhos(i,1:pontoDeCruzamento) = parents(p1,1:pontoDeCruzamento);
            filhos(i,pontoDeCruzamento+1:end) = parents(p2,pontoDeCruzamento+1:end);
        else
            if chancedeCruzamento > 0.5 
             filhos(i,:) = parents(p1,:);
            else
                filhos(i,:) = parents(p2,:);
            end
        end  
        
    end
    for i=1:n
        for j=1:8
            if probMutacao < rand(1,1) 
                if filhos(i,j) ==0
                    filhos(i,j) = 1;
                else
                    filhos(i,j) = 0;
                end
                    
            end
        end
    end
    parents = filhos;
        for i=1:n
        fitness(i,1) = fitness_ksp(parents(i,:),valor,peso,capacidade);
        end   
    melhorResultado(count) = max(fitness);
    geracao(count) = count;
    mediofitness(count) = mean(fitness);
    
    figure(1)
    plot(geracao,melhorResultado,'b.',geracao, mediofitness,'r.');
    axis([1 inf 1 45])
    titleSstring = sprintf('Problema da Mochila');
    title(titleSstring);
    xlabel('Iterações');
    ylabel('Fitness');
    legend('Melhor Fitness','Fitness Medio')
    
    count = count +1;
    end