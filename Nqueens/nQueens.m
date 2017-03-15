%Computação Evolucionaria - Professor Cristiano Araujo
%Alunos: Francis Carlos dos Santos
%        Bernardo Suarez
%        Victor Gonçalves de Oliveira
%  --------N-Queens problem -----------------------------------------------
%                   Algortmo Genético simples 
function nQueens(n,pop,max_geracao)


    mutationChance = 0.4;                %Probabilidade de ocorrer mutação
    initPop = criaPop(pop,n);           %Vetor população inicial
   
%     max_geracao = 1500;                 %Numero maximo de iterações
  
    
    [sortPop,sortSolution] = fitnessSorted(initPop);   %Avalia primeira geração e retorna vetor de populacao ordenado
 
    geracao = 1;
    media(geracao) = mean(sortSolution);%Media das soluções 

    melhorSolucao(geracao) = sortSolution(1); %Seleciona melhor soluçao da primeira geração
  
  
    while( melhorSolucao ~= 0 & geracao < max_geracao)%Loop principal do algoritmo
        
        %Passo 2 seleciona pais para reproduçao
       
        
        % Operador de variaçao 1, crossover cada par de cromossomos tem 2
        %cromossomos filhos
         i=1;
        while (i < pop/2 )
           parents = [sortPop(i,:);sortPop(i+1,:)];      %pais sao da forma -> pais = [poupacao(1);populacao(2)], depois -> pais = [poupacao(3);populacao(4)]
           temp =  CutAndCrossfill_Crossover(parents);
           offspring(i,:) = temp(1,1:n);
           offspring(i+1,:) = temp(2,1:n);
           i=i+2;
        end
        
        pop_atual = [ offspring;sortPop ];% monta populacao inteira
        [sortPop,sortSolution] = fitnessSorted(pop_atual);
        sortPop = sortPop(1:pop/2,:);
        new = criaPop(pop/2,n);
         pop_atual = [ offspring;sortPop ];
        %Passo 2 Avalia chance de mutacao e faz a operaçao de mutaçao
     for i=1:(pop/2)
        if mutationChance > rand(1,1)
            
            %seleciona cromossomo para mutar
%             cromossomo = randi([1 pop],1,1);
            pos1 = randperm(n,1);
            pos2 = randperm(n,1);
            pop_atual( i,pos1) = offspring( i,pos2);
            pop_atual( i,pos2) = offspring( i,pos1);
        end
     end
        
        
        [sortPop,sortSolution] = fitnessSorted(pop_atual);                 %Avalia nova geracao
   
%         
        sortPop = sortPop(1:pop,:);       
        sortSolution = sortSolution(1:pop,:);
        geracao = geracao+1;
        x(geracao) = geracao;
        melhorSolucao(geracao) = sortSolution(1);
        media(geracao) = mean(sortSolution);
        
    %plota resultador e atualiza a cada geração
    y = melhorSolucao;
    figure(1)
    plot(x,y,'b.',x,media,'m.')
    axis([1 (geracao+10) -2 inf])
    titleSstring = sprintf('%d-Queens Problem',n);
    title(titleSstring);
    xlabel('Geração');
    ylabel('Fitness');
    legend('Melhor Fitness','Media')

    end
    clear all;
    clc;
end

function [initPop] = criaPop(pop,n)
    
initPop = zeros(pop,n);

    for i=1:pop
        initPop(i,:) = randperm(n);
    end
end


    