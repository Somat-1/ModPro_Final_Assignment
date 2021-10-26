%% ModPro - Final Assessment - Truss_definition
% Asvaldur Gabriel Moura Palsson
% 29/10/2021

%% i) Defining the variables

% a) Coordinates Matrix: the coordinates of the joints, where column 1 is
% the x-coordinates and column 2 is the y-coordinates and column 3 is the
% z-coordinates
jointCoordinates= [0 0 0;1 0 0;0 1 0;1/3 1/3 1];

% b) Trusses matrix: Trusses and the joints that they connect. The first
% column corresponds to the i-joint of the truss and the second column is
% the j-joint of the truss
trusses=[1 4;2 4;3 4];

% c) Reaction forces Matrix: 
% The joint on which the support reaction acts (column 1) and the direction of the force (column 2, with 1=x-direction, 2=y-direction and 3=z-direction)
supportReactions=[1 1;1 2;1 3;2 1;2 2;2 3;3 1;3 2;3 3];

% d) The externalForces Matrix, where the first column is the joint
% number, the second column is the direction of the force (same as the supportReactions matrix) and the the
% third column if the magnitude of the external forces
externalForces= [4 1 -100; 4 2 -50; 4 3 30];
