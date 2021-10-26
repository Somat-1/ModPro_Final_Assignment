%% ModPro - Final Assessment - Main file
%Asvaldur Gabriel Moura Palsson
%29/10/2021

%% clearing the command window and the variables
clc, clear

%% i) Running the truss initialization file
truss_definition;

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

%% iv)
for iTruss=1:nTrusses
% a) defining iJoints and jJoints
iJoint=trusses(iTruss,1);
jJoint=trusses(iTruss,2);

% b) Calculating deltaX and deltaY
deltaX=jointCoordinates(jJoint,1)-jointCoordinates(iJoint,1);
deltaY=jointCoordinates(jJoint,2)-jointCoordinates(iJoint,2);

% c) Calculating the length of the truss
L= sqrt((deltaX)^2+(deltaY)^2);

% d) Assigning the di
A(iJoint,iTruss)=deltaX/L;
A(jJoint,iTruss)=-deltaX/L;
A(iJoint+nJoints,iTruss)=deltaY/L;
A(jJoint+nJoints,iTruss)=-deltaY/L;
end

%% v) 