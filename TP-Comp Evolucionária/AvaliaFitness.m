function [ fitness ] = AvaliaFitness( maquina,job,pop)

i=1;
j=1;
k=1;
t1=0;
t2=0;
t3=0;
candidato = 1;
feito = 0;
contGeral =0;
start2=0;
start3=0;
[x,y] = size(job);
[ct,r] = size(pop);
fitness = zeros(1,ct);
while(candidato ~= ct+1)
    if maquina(1).Disponivel == 1
        tempo1 = job(pop(candidato,i),1);
        maquina(1).Contador = maquina(1).Contador +1;
        maquina(1).Done = 0;
        maquina(1).Disponivel = 0;
        if maquina(1).Contador == tempo1
            maquina(1).Contador = 0;
            maquina(1).Done = 1;
            maquina(1).Disponivel = 1;
            i = i + 1;
            t1 = t1 + 1;
            if t1 == x
                maquina(1).Contador = 0;
                maquina(1).Disponivel = 0;
            end
        end
        %     end
    elseif t1 < x
        maquina(1).Contador = maquina(1).Contador +1;
        if maquina(1).Contador == tempo1
            maquina(1).Contador = 0;
            maquina(1).Disponivel = 1;
            maquina(1).Done = 1;
            i = i + 1;
            t1 = t1 + 1;
            if t1 == x
                maquina(1).Contador = 0;
                maquina(1).Disponivel = 0;
            end
        end
    end
    
    if maquina(1).Done == 1 && maquina(2).Disponivel == 1
        tempo2 = job(pop(candidato,j),2);
        maquina(2).Done = 0;
        maquina(2).Disponivel = 0;
        start2 = 1;
        %     end
        
    elseif start2 == 1
        maquina(2).Contador = maquina(2).Contador +1;
        if maquina(2).Contador == tempo2
            maquina(2).Disponivel = 1;
            maquina(2).Done = 1;
            maquina(2).Contador = 0;
            start2 = 0;
            j = j+1;
            t2 = t2 + 1;
            if t2 == x
                maquina(2).Contador = 0;
                maquina(2).Disponivel = 0;
            end
        end
    end
    if maquina(2).Done == 1 && maquina(3).Disponivel == 1
        tempo3 = job(pop(candidato,k),3);
        maquina(3).Done = 0;
        maquina(3).Disponivel = 0;
        start3 = 1;
        %         end
    elseif start3 == 1
        maquina(3).Contador = maquina(3).Contador +1;
        if maquina(3).Contador == tempo3
            maquina(3).Disponivel = 1;
            maquina(3).Done = 1;
            maquina(3).Contador = 0;
            start3 = 0;
            k = k + 1;
            feito = feito + 1;
            t3 = t3 + 1;
            if t3 == x
                maquina(3).Contador = 0;
                maquina(3).Disponivel = 0;
            end
        end
    end
    
    if feito == x
        fitness(1,candidato) = contGeral;
        contGeral = 0;
        candidato = candidato + 1;
        feito = 0;
        maquina(1).Disponivel = 1;
        maquina(2).Disponivel = 1;
        maquina(3).Disponivel = 1;
        maquina(1).Done = 0;
        maquina(2).Done = 0;
        maquina(3).Done = 0;
        maquina(1).Contador = 0;
        maquina(2).Contador = 0;
        maquina(3).Contador = 0;
        t1=0;
        t2=0;
        t3=0;
        i=1;
        j=1;
        k=1;
        start2=0;
        start3=0;
        tempo1=0;
        tempo2=0;
        tempo3=0;
    end
    contGeral = contGeral + 1;
end

end