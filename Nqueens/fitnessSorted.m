function [sortPop,sortSolution]=fitnessSorted(populacao)
    
    
    [x,y] = size(populacao);
    tam = x;
    n = y;
    f= zeros(tam,1);
    
  for i = 1:tam                                   
    fitness_temp=0;
    
    %fitness calculation loop
    
    for k=1:(n-1)                                               
        for j=k+1:n                                        
           z=abs(populacao(i,k)-populacao(i,j));           
            if (ne(z,0)&& ne(z,(j-k)))                      
                 fitness_temp=fitness_temp+1;                
            end                                               
        end                                                
    end
    f(i,1)=fitness_temp/2;
   end
    
    [sortSolution,index] = sort(f);
    sortPop = zeros(tam,n);
    for i=1:tam
        sortPop(i,:) = populacao(index(i),:);
    end
        
    
end