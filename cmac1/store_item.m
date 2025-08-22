% store_item.m
% Add a training point to the dataset and train the CMAC
%
% This function takes the current point coordinates (from pcoords),
% adds it to the training set, displays it as a yellow marker on the
% input plot, and immediately trains the CMAC on this point.

% Switch to the input panel and add visual marker for this training point
subplot(ax_in)
h = plot(pcoords(1),pcoords(2),'yo');  % Yellow circle marker
set(h,'ButtonDownFcn','clickhandler')  % Make marker clickable

% Add this point to the training dataset
training_points(end+1,:) = pcoords;

% Update the training point counter display
xlabel(sprintf('N = %d training points',size(training_points,1)))

% Train the CMAC on this new point
train_point
