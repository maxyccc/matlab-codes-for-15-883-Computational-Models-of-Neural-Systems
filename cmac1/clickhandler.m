% clickhandler.m
% Handle mouse clicks on the input function plot
%
% This function is called when the user clicks on the green curve in the
% input panel. It converts the click position to an input value, looks up
% the corresponding target output, and adds this as a training point.

% Get the mouse click position in the axes
p = get(ax_in,'CurrentPoint');

xcoords(1);  % Work-around for bug in MATLAB 7.0.0

% Convert click position to valid input value (0-359 degrees)
xval = max(xcoords(1),min(xcoords(end),floor(p(1))));
last_point = xval;  % Remember this point for visualization

% Create coordinate pair [input, target_output]
pcoords = [xval ycoords(1+xval)];  % Note: ycoords is 1-indexed

% Add this point to the training set and train the CMAC
store_item

% Update all visualizations
plot_cmac
