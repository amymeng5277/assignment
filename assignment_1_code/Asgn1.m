clear all
close all

figure

%Case 1 
plotIndex = 1;
NA = 200; NB = 200;
mu_1_A = [0 0]'; sigma_1_A = [1 0; 0 1];
mu_1_B = [3 0]'; sigma_1_B = [1 0; 0 1];
xDim1 = -3:1:6; yDim1 = -4:1:4;
class_1_A = CaseClass(mu_1_A,sigma_1_A,NA/(NA+NB), NA);
class_1_B = CaseClass(mu_1_B,sigma_1_B,NB/(NA+NB), NB);
[data_A, data_B] = Asgn1LibPlot.Plot_MED_GED_MAP(plotIndex, class_1_A, class_1_B, xDim1, yDim1);

%Case 2
plotIndex = 2;
NA = 200; NB = 200;
mu_1_A = [-1 0]'; sigma_1_A = [4 3; 3 4];
mu_1_B = [1 0]'; sigma_1_B = [4 3; 3 4];
xDim1 = -8:1:8; yDim1 = -8:1:8;
class_1_A = CaseClass(mu_1_A,sigma_1_A,NA/(NA+NB), NA);
class_1_B = CaseClass(mu_1_B,sigma_1_B,NB/(NA+NB), NB);
[data_A, data_B] = Asgn1LibPlot.Plot_MED_GED_MAP(plotIndex, class_1_A, class_1_B, xDim1, yDim1);

%Case 3
plotIndex = 3;
NA = 200; NB = 200;
mu_1_A = [0 0]'; sigma_1_A = [3 1; 1 2];
mu_1_B = [3 0]'; sigma_1_B = [7 -3; -3 4];
xDim3 = -6:1:10; yDim3 = -6:1:10;
class_3_A = CaseClass(mu_1_A,sigma_1_A,NA/(NA+NB), NA);
class_3_B = CaseClass(mu_1_B,sigma_1_B,NB/(NA+NB), NB);
[data_3_A, data_3_B] = Asgn1LibPlot.Plot_MED_GED_MAP(plotIndex, class_3_A, class_3_B, xDim3, yDim3);

%Case 4
plotIndex = 4;
NA = 200; NB = 200;
load('case4.mat')
mu_1_A = mean(a)'; sigma_1_A = cov(a);
mu_1_B = mean(b)'; sigma_1_B = cov(b);
xDim1 = 150:10:440; yDim1 = 0:10:350;
class_1_A = CaseClass(mu_1_A,sigma_1_A,NA/(NA+NB), NA);
class_1_B = CaseClass(mu_1_B,sigma_1_B,NB/(NA+NB), NB);
Asgn1LibPlot.PlotWithData(plotIndex, class_1_A, class_1_B, xDim1, yDim1, a, b);

%Case 3, KNN-MAP
Asgn1LibPlot.Plot_MAP_KNN(class_3_A, class_3_B, data_3_A, data_3_B, xDim3, yDim3)


