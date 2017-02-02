classdef CaseClass
    
    properties
        mu
        sigma
        prob
        data_points 
    end
    
    methods
        function CC = CaseClass(mu,sigma,prob,data_points)
            CC.mu = mu;
            CC.sigma = sigma;
            CC.prob = prob;
            CC.data_points = data_points;
        end
    end
end

    
