function Zfobj = AvaliaFitness(fobj,x,y)

    [u,v] = size(x);

    if (nargin == 2) %caso seja chamada de dentro da fun��o principal
    
        % Avalia a popula��o de solu��es
        for i = 1:v
            Zfobj(i) = feval(fobj, x(:,i));        
        end
    
    elseif (nargin == 3)%caso seja chamada pela fun��o Plotar
    
        % Avalia matriz de dados para plot 
        for i = 1:u
            for j = 1:v
                Zfobj(i,j) = feval(fobj, [x(i,j) y(i,j)]);
            end
        end    
    end
end