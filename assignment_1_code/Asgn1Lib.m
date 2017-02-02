classdef Asgn1Lib
    %This is the library functions of Assignment1
    
    methods (Static = true)
        function GD = GenerateDist(class)
            GD = mvnrnd(class.mu, class.sigma, class.data_points);
        end
        
        function MED_Distance = MEDDistance(data_point,class)
            MED_Distance = sqrt((data_point - class.mu)'*(point - class.mu));
        end
        
       function MEDDist = MEDDist(X,Y,class)       
            MEDDist = sqrt((X - class.mu(1)).^2+(Y - class.mu(2)).^2);
       end
       
       function GEDDist = GEDDist(x,y,class)
           temp = [x y]' - class.mu;
           GEDDist = temp'*inv(class.sigma)*temp;
       end
       
       function MAPDist = MAPDist(x,y,class)
          MAPDist = class.prob*exp(-0.5*Asgn1Lib.GEDDist(x,y,class))/(det(class.sigma))^(0.5);
       end
        
        function MED_Boundary = MEDBoundary2(X,Y,class_1,class_2)
            MED_Boundary = zeros(size(X));
            MEDDist1 = Asgn1Lib.MEDDist(X,Y,class_1);
            MEDDist2 = Asgn1Lib.MEDDist(X,Y,class_2);

            [h,w] = size(MEDDist1);
            for i = 1:w
                for j = 1:h

                    MED_Boundary(j,i) = min(MEDDist1(j,i),MEDDist2(j,i));
                end
            end
        end
        
        function MED_Boundary = MEDBoundary3(X,Y,class_1,class_2,class_3)
            MED_Boundary = zeros(size(X));
            MEDDist1 = Asgn1Lib.MEDDist(X,Y,class_1);
            MEDDist2 = Asgn1Lib.MEDDist(X,Y,class_2);
            MEDDist3 = Asgn1Lib.MEDDist(X,Y,class_3);

            [h,w] = size(MEDDist1);
            for i = 1:w
                for j = 1:h

                    MED_Boundary(j,i) = Asgn1Lib.GetSmallestValue3(MEDDist1(j,i),MEDDist2(j,i),MEDDist3(j,i));
                end
            end
        end
        
        function  SV = GetSmallestValue3(x,y,z)
            if x <= y
                SV = 0;
            else
                SV = 1;
            end
            if z <= y && z <= x
                SV = 2;
            end
                
        end
        
        function  SV = GetSmallestValue3MAP(x,y,z)
            if x >= y
                SV = 0;
            else
                SV = 1;
            end
                if z >= y && z >= x
                    SV = 2;
                end
                
        end
        
        function  SV = GetSmallestValue2(x,y)
            if x <= y
                SV = 0;
            else
                SV = 1;
            end
                
        end
        
        function GED_Boundary = GEDBoundary2(X,Y,class_1,class_2)
            GED_Boundary = zeros(size(X));

            [h,w] = size(GED_Boundary);
            for i = 1:w
                for j = 1:h
                    GEDDist1 = Asgn1Lib.GEDDist(X(1,i),Y(j,1), class_1);
                    GEDDist2 = Asgn1Lib.GEDDist(X(1,i),Y(j,1), class_2);
                    GED_Boundary(j,i) = min(GEDDist1,GEDDist2);
                end
            end
            
        end
        
         function GED_Boundary = GEDBoundary3(X,Y,class_1,class_2,class_3)
            GED_Boundary = zeros(size(X));

            [h,w] = size(GED_Boundary);
            for i = 1:w
                for j = 1:h
                    GEDDist1 = Asgn1Lib.GEDDist(X(1,i),Y(j,1), class_1);
                    GEDDist2 = Asgn1Lib.GEDDist(X(1,i),Y(j,1), class_2);
                    GEDDist3 = Asgn1Lib.GEDDist(X(1,i),Y(j,1), class_3);
                    GED_Boundary(j,i) = Asgn1Lib.GetSmallestValue3(GEDDist1,GEDDist2,GEDDist3);
                end
            end
            
         end
         
         function MAP_Boundary = MAPBoundary2(X,Y,class_1,class_2)
            MAP_Boundary = zeros(size(X));

            [h,w] = size(MAP_Boundary);
            for i = 1:w
                for j = 1:h
                    MAPDist1 = Asgn1Lib.MAPDist(X(1,i),Y(j,1), class_1);
                    MAPDist2 = Asgn1Lib.MAPDist(X(1,i),Y(j,1), class_2);
                    MAP_Boundary(j,i) = min(MAPDist1,MAPDist2);
                end
            end
            
         end
        
         function MAP_Boundary = MAPBoundary3(X,Y,class_1,class_2,class_3)
            MAP_Boundary = zeros(size(X));

            [h,w] = size(MAP_Boundary);
            for i = 1:w
                for j = 1:h
                    MAPDist1 = Asgn1Lib.MAPDist(X(1,i),Y(j,1), class_1);
                    MAPDist2 = Asgn1Lib.MAPDist(X(1,i),Y(j,1), class_2);
                    MAPDist3 = Asgn1Lib.MAPDist(X(1,i),Y(j,1), class_3);
                    MAP_Boundary(j,i) = Asgn1Lib.GetSmallestValue3MAP(MAPDist1,MAPDist2,MAPDist3);
                end
            end
            
         end
         
         %sorting function from Mathworks
         function [smallestNElements smallestNIdx] = getNElements(A, n)
             [ASorted AIdx] = sort(A);
             smallestNElements = ASorted(1:n);
             smallestNIdx = AIdx(1:n);
            end
        
         function EucledianDistance = EucledeanDistance2(X,Y,r1)
             EucledianDistance = sqrt((X - r1(:,1)).^2+(Y - r1(:,2)).^2);
         end
         
         function KNN_Boundary = KNNBoundary2(X,Y,r1,r2,K)
             if ~exist('K', 'var') || isempty(K)
                K = 1;
            end
             KNN_Boundary = zeros(size(X));
             EucDist1 = 50;
             EucDist2 = 50;
             
             [h,w] = size(KNN_Boundary);
             
             for i = 1:w
                for j = 1:h

                        temp1 = Asgn1Lib.EucledeanDistance2(X(1,i),Y(j,1),r1);
                        EucDist1 = Asgn1Lib.getNElements(temp1,K);

                        temp2 = Asgn1Lib.EucledeanDistance2(X(1,i),Y(j,1),r2);
                        EucDist2 = Asgn1Lib.getNElements(temp2,K);

                    %if K == 1
                        class1_mean = mean(EucDist1);
                        class2_mean = mean(EucDist2);
                        KNN_Boundary(j,i) = min(class1_mean,class2_mean);
                        EucDist1 = 50;
                        EucDist2 = 50;
                    %end
                    
                    
                end
             end
         end
         
         function KNN_Boundary = KNNBoundary3(X,Y,r1,r2,r3,K)
             if ~exist('K', 'var') || isempty(K)
                K = 1;
            end
             KNN_Boundary = zeros(size(X));
             EucDist1 = 50;
             EucDist2 = 50;
             EucDist3 = 50;
             
             [h,w] = size(KNN_Boundary);
             
             for i = 1:w
                for j = 1:h

                        temp1 = Asgn1Lib.EucledeanDistance2(X(1,i),Y(j,1),r1);
                        EucDist1 = Asgn1Lib.getNElements(temp1,K);

                        temp2 = Asgn1Lib.EucledeanDistance2(X(1,i),Y(j,1),r2);
                        EucDist2 = Asgn1Lib.getNElements(temp2,K);
                        
                        temp3 = Asgn1Lib.EucledeanDistance2(X(1,i),Y(j,1),r3);
                        EucDist3 = Asgn1Lib.getNElements(temp3,K);

                        class1_mean = mean(EucDist1);
                        class2_mean = mean(EucDist2);
                        class3_mean = mean(EucDist3);
                        KNN_Boundary(j,i) = Asgn1Lib.GetSmallestValue3(class1_mean,class2_mean,class3_mean);
                        EucDist1 = 50;
                        EucDist2 = 50;
                        EucDist3 = 50;                    
                    
                end
            end
        end
        
        
    end
end


