% Assignment 1; statistically determinable truss
% Truss definition script to define the truss

collect_data


% jointCoordinates - 4 by 2 matrix, with the x-coordinates in the first column and
% the y-coordinates in the second column
    jointCoordinates = S;

    
%  by 2 matrix, with each row containing the joint numbers that are
% connected by each truss.
    trusses = 0;
    
    
%  4 by 2 matrix. Each row contains one reaction force, with the
%  first column representing the joint number, and the second column the direction of
% the reaction force (1 for x-direction and 2 for y-direction).
    supportReactions = 0;
    
    
%  by 3 matrix.  Each row contains one external force, withthe first column representing
% the joint number, the second column the direction ofthe external force 
% (1 for x-direction and 2 for y-direction) and the third column themagnitude of the external force.
    externalForces = 0 ;
    
    
    
    
    
