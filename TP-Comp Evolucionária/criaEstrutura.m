function [ maquina ] = criaEstrutura( n )
field0 = 'Maquina';
Maquina = 0;
field1 = 'Disponivel';
disp = 0;
field2 = 'Linha';
linha=0;
field3 = 'Contador';
cont = 0;
field4 = 'Done';
feito = 0;
maquina = struct(field0,Maquina,field1,disp,field2,linha,field3,cont,field4,feito);


    for i=1:n
        maquina(i).Maquina = i;
        maquina(i).Disponivel = 1;
        maquina(i).Linha = 0;
        maquina(i).Contador = 0;
        maquina(i).Done = 0;
    end


end

