% script to collect the data of the truss by the user input

% for joint coordinates: 
clear 
clc

M = [];
N = [];
r = 4;


for i = 1:r

   a = input(['Input the ' num2str(i) ' x coord']);
   b = input(['Input the ' num2str(i) ' y coord']);
     
    N(end+1) = a;
    M(end+1) = b;
   
end

S = [N.' M.'];

disp(N)
disp(M)
disp(S)