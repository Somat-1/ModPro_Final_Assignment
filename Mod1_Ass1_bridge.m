% ModPro Module 1, Session 5, Exercise 2
% question viii)
% Jos Havinga
% 20-10-2019

% Definition of bridge frame

% define joint coordinates, [x, y]
% each row gives the coordinates of one joint
jointCoordinates = zeros(16,2);
% top arc
L1 = 50;
L2 = 40;
L3 = (L1^2 + L2^2)/(2*L2);
theta = asin(L1/L3);
[x,y]=pol2cart(linspace(pi/2 + theta,pi/2 - theta,9),L3);
jointCoordinates(1:9,1) = x';
jointCoordinates(1:9,2) = y' - (L3 - L2);
% bottom arc
L2 = 5;
L3 = (L1^2 + L2^2)/(2*L2);
theta = asin(L1/L3);
[x,y]=pol2cart(linspace(pi/2 - theta,pi/2 + theta,7),L3);
jointCoordinates(9:14,1) = x(1:(end-1))';
jointCoordinates(9:14,2) = y(1:(end-1))' - (L3 - L2);
jointCoordinates(9:14,2) = -jointCoordinates(9:14,2);
% Central nodes
jointCoordinates(15,:) = mean(jointCoordinates([5 13],:));
jointCoordinates(16,:) = mean(jointCoordinates([5 11],:));
     
% define trusses, indicating which joints are connected by each truss
% in each row, one truss is defined
trusses = zeros(29,2);
trusses(1:14,1) = 1:14;
trusses(1:13,2) = 2:14;
trusses(14,2) = 1;
trusses(15,:) = [2 14];
trusses(16,:) = [3 14];
trusses(17,:) = [3 13];
trusses(18,:) = [3 15];
trusses(19,:) = [4 15];
trusses(20,:) = [5 15];
trusses(21,:) = [13 15];
trusses(22,:) = [5 12];
trusses(23,:) = [11 16];
trusses(24,:) = [5 16];
trusses(25,:) = [6 16];
trusses(26,:) = [7 16];
trusses(27,:) = [7 11];
trusses(28,:) = [7 10];
trusses(29,:) = [8 10];

% define reaction forces, [node number, direction (1 = x, 2 = y)]
% in each row, one reaction force is defined
supportReactions =  [1 1;...
                    1 2;...
                    9 2];

% define external forces [node number, direction (x = 1, y = 2), magnitude]
% in each row, one external force is defined
externalForces = [10 1 -50;...
                  11 1 -100;...
                  12 1 -50;...
                  10 2 -100;...
                  11 2 -200;...
                  12 2 -100];