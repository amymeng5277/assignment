classdef Asgn1LibPlot
    %This is the library functions of Assignment1    
    methods (Static = true)        
        function [data_A, data_B] = Plot_MED_GED_MAP(plotIndex, class_A, class_B, x_axis, y_axis)
            data_A = Asgn1Lib.GenerateDist(class_A);
            data_B = Asgn1Lib.GenerateDist(class_B);            
            Asgn1LibPlot.PlotWithData(plotIndex, class_A, class_B, x_axis, y_axis, data_A, data_B);                      
        end        
        function PlotWithData = PlotWithData(plotIndex, class_A, class_B, x_axis, y_axis, data_A, data_B)
            [X1, Y1] = meshgrid(x_axis,y_axis);

            MED_Boundary = Asgn1Lib.MEDBoundary2(X1,Y1,class_A,class_B);
            GED_Boundary = Asgn1Lib.GEDBoundary2(X1,Y1,class_A,class_B);
            MAP_Boundary = Asgn1Lib.MAPBoundary2(X1,Y1,class_A,class_B);

            subplot(2,2,plotIndex)
            plot(data_A(:,1),data_A(:,2),'b.');
            hold on;
            plot(data_B(:,1),data_B(:,2),'ro');
            hold on;         
            xlabel('feature1');
            ylabel('feature2');
            title(sprintf('%s%d','MED, GED and MAP Plots for Case ', plotIndex));
            [~,med_boundary]=contour(x_axis,y_axis,MED_Boundary,1);
            set(med_boundary,'EdgeColor','k');
            [~,ged_boundary]=contour(x_axis,y_axis,GED_Boundary,1);
            set(ged_boundary,'EdgeColor','m');
            [~,map_boundary]=contour(x_axis,y_axis,MAP_Boundary,1);
            set(map_boundary,'EdgeColor','g');           
        end
        
        function Plot_MAP_KNNWithData = Plot_MAP_KNNWithData(plotIndex, class_A, class_B, data_A, data_B, x_axis, y_axis, NN_Boundary, MAP_Boundary)
            subplot(2,2, plotIndex)
            plot(data_A(:,1),data_A(:,2),'b.');
            hold on;
            plot(data_B(:,1),data_B(:,2),'ro');
            hold on;
            xlabel('feature1');
            ylabel('feature2');
            title(sprintf('MAP and %dNN Plots for Case 3', plotIndex));
            [~,nn_boundary]=contour(x_axis,y_axis,NN_Boundary,1);
            set(nn_boundary,'EdgeColor','m');
            hold on;
            [~,map_boundary]=contour(x_axis,y_axis,MAP_Boundary,1);
            set(map_boundary,'EdgeColor','g');
        end
        
        function Plot_MAP_KNN = Plot_MAP_KNN(class_A, class_B, data_A, data_B, x_axis, y_axis)
            [X1, Y1] = meshgrid(x_axis,y_axis);            
            % K=1 therefore just NN
            MAP_Boundary = Asgn1Lib.MAPBoundary2(X1,Y1,class_A,class_B);
            NN_Boundary = Asgn1Lib.KNNBoundary2(X1,Y1,data_A,data_B,1);
            K3NN_Boundary = Asgn1Lib.KNNBoundary2(X1,Y1,data_A,data_B,3);
            k5NN_Boundary = Asgn1Lib.KNNBoundary2(X1,Y1,data_A,data_B,5);
            figure
            Asgn1LibPlot.Plot_MAP_KNNWithData(1, class_A, class_B, data_A, data_B, x_axis, y_axis, NN_Boundary, MAP_Boundary);
            Asgn1LibPlot.Plot_MAP_KNNWithData(2, class_A, class_B, data_A, data_B, x_axis, y_axis, K3NN_Boundary, MAP_Boundary);
            Asgn1LibPlot.Plot_MAP_KNNWithData(3, class_A, class_B, data_A, data_B, x_axis, y_axis, k5NN_Boundary, MAP_Boundary);

            
        end
    
    end
end
