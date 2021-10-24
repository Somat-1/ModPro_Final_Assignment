% Assignment 1; statistically determinable truss
% Truss definition script to define the truss

% collect_data ; gets the joint coordinates by user input (S)


% jointCoordinates - 4 by 2 matrix, with the x-coordinates in the first column and
% the y-coordinates in the second column
    jointCoordinates = [0 0; 0.5 -0.6; 1.2 -0.7; 1 0];

    
%  by 2 matrix, with each row containing the joint numbers that are
% connected by each truss.
    trusses = [1 2; 2 3; 2 4; 3 4];
    
    
%  4 by 2 matrix. Each row contains one reaction force, with the
%  first column representing the joint number, and the second column the direction of
% the reaction force (1 for x-direction and 2 for y-direction).
    supportReactions = [1 -1; 1 -2; 4 -1; 4 -2];
    
    
%  by 3 matrix.  Each row contains one external force, withthe first column representing
% the joint number, the second column the direction ofthe external force 
% (1 for x-direction and 2 for y-direction) and the third column themagnitude of the external force.
    externalForces = [2 2 -100; 3 1 -50; 3 2 30] ;
    
    
    
    
    
