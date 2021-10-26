%% ModPro - Final Assessment - Truss_definition
% Asvaldur Gabriel Moura Palsson
% 29/10/2021

%% i) Defining the variables

% a) Coordinates Matrix: the coordinates of the joints, where column 1 is the x-coordinates and column 2 is the y-coordinates
jointCoordinates= [0 0; 0.5 -0.6; 1.2 -0.7; 1 0];

% b) Trusses matrix: Trusses and the joints that they connect
trusses= [1 2; 2 4; 2 3; 3 4];

% c) Reaction forces Matrix: 
% The joint on which the support reaction acts (column 1) and the direction of the force (column 2, with 1=x-direction and 2=y-direction)
supportReactions= [1 1; 1 2; 4 1; 4 2];

% d) The external forces Matrix, where the first s=column is yhe joint
% number, the second column is the direction a=of the force and the the
% third column if the magnitude of the external forces
externalForces= [2 2 -100; 3 1 -50; 3 2 30];
