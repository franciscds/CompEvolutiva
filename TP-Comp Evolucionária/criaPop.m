function [ parents ] = criaPop( N,nJobs )

    parents = zeros(N,nJobs);
    
    for i=1:N
        parents(i,:) = randperm(nJobs);
    end

end

