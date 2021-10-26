% Assignment 1; statistically determinable truss
% Main script file for all the calculations 

clear 
clc

% runs the script "truss_definition"
truss_definition
% for the bridge use "Mod1_Ass1_bridge"
% Mod1_Ass1_bridge

% ii) checking if the truss is statistically determinable:
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

% iii) initializing the matrix A
A = zeros(numberOfEquations,numberOfUnknowns);

% for debugging and testing
disp(trusses);
disp(jointCoordinates);

% iv) creating a loop to fill out the matrix A
for iTruss = 1:nTrusses
    
%     a) finding iJoint and jJoint - the joints which are connected
    iJoint = trusses(iTruss, 1);
    jJoint = trusses(iTruss, 2);

%     b) calculating delta x and delta y
    deltaX = jointCoordinates(jJoint,1) - jointCoordinates(iJoint,1);
    deltaY = jointCoordinates(jJoint,2) - jointCoordinates(iJoint,2);
    
%     c) calculating the length of the  truss / distance between  two
%     points is given by L = sqrt(deltaX^2+deltaY^2)
    L = sqrt(deltaX^2+deltaY^2);
    
%     d) filling out the matrix A with the corresponding equilibrium equations
    A(iJoint,iTruss) = deltaX/L;
    A(jJoint,iTruss) = -deltaX/L;
    A(iJoint+nJoints,iTruss) = deltaY/L;
    A(jJoint+nJoints,iTruss) = -deltaY/L;
 
end

% v) creating the support loop to fill out the rest of the matrix A with

% for debugging and testing
disp(supportReactions);

% the unknown reaction forces
for iSupport = 1:nSupports
    
%     a) iJoint denotes the joint upon which the support reaction is acting
     iJoint = supportReactions(iSupport, 1);
     
%      b) if else end condition to determine the direction of the reaction
%      force acting on the joint
%      absval takes the absolute value of supportReactions
%      c) filling in the corresponding positions in the matrix A   
     absVal = abs(supportReactions(iSupport,2));

     if absVal == 1
        A(iJoint,nTrusses + iSupport) = -1;
     else
        A(nJoints + iJoint, nTrusses + iSupport) = -1;
     end
     
end

disp(A)

% vi) creating vector b
b = zeros(numberOfEquations,1); 

% for debugging and testing
disp(externalForces);

% get the dimension of externalForces
dimExtForces = size(externalForces);

for iExtForce = 1:dimExtForces

% a) assigning the joints to iJoint at which there are external forces acting; 
iJoint = externalForces(iExtForce,1);
forceMagnitude = -externalForces(iExtForce,3);

    if externalForces(iExtForce,2) == 1
        b(iJoint,1)= forceMagnitude;
    else
        b(nJoints+iJoint,1)= forceMagnitude;
    end

end
disp(b);

% vii) execute and check to see if the result matches
Finternal = A\b
