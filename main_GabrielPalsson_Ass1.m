%% ModPro - Final Assessment - Main file
% Asvaldur Gabriel Moura Palsson
% 29/10/2021

%% clearing the command window and the variables
clc, clear

%% i) Running the truss initialization file
truss_definition_GabrielPalsson_Ass1;

%% ii) Determining whether or not the system is statically determinate
% Defining variables
nJoints=size(jointCoordinates,1);
nTrusses=size(trusses,1);
nSupports=size(supportReactions,1);

numberOfUnknowns=(nTrusses+nSupports);
numberOfEquations=(2*nJoints);

% Finding if it is statically determinate
if(numberOfUnknowns ~= numberOfEquations)
    error('Defined truss system is not statically determinate');
end

%% iii) Initializing matrix A 
A=zeros(numberOfEquations,numberOfUnknowns);

%% iv) Adding the unknown Truss forces to the matrix A
for iTruss=1:nTrusses
% a) defining iJoint and jJoint for iTruss
iJoint=trusses(iTruss,1);
jJoint=trusses(iTruss,2);

% b) Calculating deltaX and deltaY
deltaX=jointCoordinates(jJoint,1)-jointCoordinates(iJoint,1);
deltaY=jointCoordinates(jJoint,2)-jointCoordinates(iJoint,2);

% c) Calculating the length of the truss
L= sqrt((deltaX)^2+(deltaY)^2);

% d) Assigning the different coefficients for the truss forces in the
% matrix A
A(iJoint,iTruss)=deltaX/L;
A(jJoint,iTruss)=-deltaX/L;
A(iJoint+nJoints,iTruss)=deltaY/L;
A(jJoint+nJoints,iTruss)=-deltaY/L;
end

%% v) Adding the Support forces to the matrix A
for iSupport=1:nSupports;
% a) defining iJoint for iSupport
iJoint=supportReactions(iSupport,1);

% b)+c):
% b) Checking whether the reactions are in the x- or the y-direction
% c) Assigning the value -1 to the correct positions in matrix A
if (supportReactions(iSupport,2)~=1)
A(nJoints+iJoint,nTrusses+iSupport)=-1;
else
    A(iJoint,nTrusses+iSupport)=-1;
end
end

%% vi) Creating the column vector b
% Initializing b
b=zeros(numberOfEquations,1);

nExtForces=size(externalForces,1);
for iExtForce=1:nExtForces

% a) defining iJoint 
iJoint=externalForces(iExtForce,1);

% b)+c):
% b) Checking in which direction each external force acts
% c) Assigning the negative magnitude of each external force in the vector b
if externalForces(iExtForce,2)~= 1
    b(iJoint+nJoints,1)=-externalForces(iExtForce,3);
else
    b(iJoint,1)=-externalForces(iExtForce,3);
end
end

%% vii) Solving the set of linear equations

Finternal=A\b;

% the meaning for the entries of the result vector Finternal is all of the
% truss forces and the reaction forces.
% The first 4 values in the solution vector Finternal are the truss forces
% so: F(1-2),F(2-4),F(2-3) and F(3-4), in that order.
% The last 4 values in the solution matrix Finternal are the reaction
% forces, so: R(1x),R(1y),R(4x) and R(4y) in that order.

%% viii) Using the code from main_GabrielPalsson for the bridge
% upon changing the line 9 of this script from "truss_definition_GabrielPalsson;" to "Mod1_Ass1_bridge;", running this
% script and then running the "Mod1_Ass1_plotframe" we get the same result
% as shown in the PDF.
