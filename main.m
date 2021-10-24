% Assignment 1; statistically determinable truss
% Main script file for all the calculations 


% runs the script "truss_definition"
truss_definition

% checking if the truss is statistically determinable:
% number of joints noted nJoints
[m,n] = size(jointCoordinates);
nJoints = m;

% number of trusses noted nTrusses
[m,n] = size(trusses);
nTrusses = m;

% number of reaction forces notet nSupport
[m,n] = size(supportReactions);
nSupports = m;

% number of unknowns and number of equations, with their respective names:
numberOfUnknowns = nTrusses + nSupports;
numberOfEquations = 2*nJoints;

% condition to disp an error if the truss is statistically over- or under-
% determinable
if (numberOfEquations ~= numberOfUnknowns)
   error('Defined truss system is not statically determinate');
end

A = zeros(numberOfEquations,numberOfUnknowns);


    
    
