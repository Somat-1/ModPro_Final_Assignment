% ModPro Module 1, Session 5, Exercise 2
% Jos Havinga
% 20-10-2019

% Code for plotting frame
% Without results: plot frame in black
% With results: plot colored frame, red = compression, blue = tension

% Initialize figure
figure
hold on
ax = gca;
ax.Position = [0 0 1 1];
ax.YTick = [];
ax.XTick = [];

% Plot trusses
if ~exist('Finternal','var')
    % In case that no results are present
    for iTruss = 1:size(trusses,1)
        plot(jointCoordinates(trusses(iTruss,:),1),jointCoordinates(trusses(iTruss,:),2),'-k','LineWidth',2)
    end
else
    % In case that results are present
    Fmax = max(max(abs(Finternal(1:size(trusses,1)))),1e-10); % Fmax is used to normalize the maximum force
    % Anonymous function c is used to determine the color of each truss
    % Blue (rgb [0 0 1]) = tension
    % Red (rgb [1 0 0]) = compression
    c = @(x) [interp1([-1 0 1],[1 1 0],x) interp1([-1 0 1],[0 1 0],x) interp1([-1 0 1],[0 1 1],x)];
    for iTruss = 1:size(trusses,1)
        plot(jointCoordinates(trusses(iTruss,:),1),jointCoordinates(trusses(iTruss,:),2),'-',...
            'LineWidth',2 + 3*abs(Finternal(iTruss))/Fmax,'Color',c(Finternal(iTruss)/Fmax))
    end
end

% Plot joints
plot(jointCoordinates(:,1),jointCoordinates(:,2),'ok','MarkerFaceColor',[0 0 0],'MarkerSize',6)

% Now it is time to plot force vectors
% qmax is used to determine the maximum allowed length of a vector. It is
% set to 0.2 times the length of the diagonal of the figure
qmax = sqrt(sum((max(jointCoordinates)-min(jointCoordinates)).^2))*0.2;
if ~exist('Finternal','var')
    reactionForces = [];
else
    reactionForces = Finternal((size(trusses,1)+1):end);
end
% Determine the maximum size of the forces
Fmaxq = max(abs([reactionForces;externalForces(:,3)]));

% For each support, plot the vectors
for iSupport = 1:size(supportReactions,1)
    if ~exist('Finternal','var')
        % If no results are present, use qmax as length of the vector
        qL = qmax;
    else
        % If results are present, change the length by the size of the
        % force
        qL = qmax*reactionForces(iSupport)/Fmaxq;
    end
    if supportReactions(iSupport,2) == 1
        % If support reaction in x-direction
        % quiver is a function to plot arrows
        quiver(jointCoordinates(supportReactions(iSupport,1),1),jointCoordinates(supportReactions(iSupport,1),2),...
            -qL,0,'r','MaxHeadSize',1,'LineWidth',2)
    else
        % If support reaction in y-direction
        % quiver is a function to plot arrows
        quiver(jointCoordinates(supportReactions(iSupport,1),1),jointCoordinates(supportReactions(iSupport,1),2),...
            0,-qL,'r','MaxHeadSize',1,'LineWidth',2)
    end
end

% For each external force, plot the arrows
for iExt = 1:size(externalForces,1)
    % Set the length of the arrow
    qL = qmax*externalForces(iExt,3)/Fmaxq;
    if externalForces(iExt,2) == 1
        % If external force in x-direction
        % quiver is a function to plot arrows
        quiver(jointCoordinates(externalForces(iExt,1),1),jointCoordinates(externalForces(iExt,1),2),...
            qL,0,'b','MaxHeadSize',1,'LineWidth',2)
    else
        % If external force in y-direction
        % quiver is a function to plot arrows
        quiver(jointCoordinates(externalForces(iExt,1),1),jointCoordinates(externalForces(iExt,1),2),...
            0,qL,'b','MaxHeadSize',1,'LineWidth',2)
    end
end

% Set the scaling of the x- and y-axis to equal
axis equal
% Zoom out
ax.YLim = ax.YLim + diff(ax.YLim)*0.1*[-1 1];
