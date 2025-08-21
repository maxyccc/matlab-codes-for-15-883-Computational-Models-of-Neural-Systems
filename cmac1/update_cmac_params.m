% update_cmac_params - Callback function for CMAC parameter GUI controls
% This function handles updates to Nhashes, Nbuckets_per_hash, and hash_stride
% parameters from the GUI edit boxes, validates input, and re-initializes the CMAC.

% Copyright (c) 1997, 2005 by David S. Touretzky.
% Carnegie Mellon University

% Get the handle and tag of the control that triggered the callback
h = gcbo;
tag = get(h, 'Tag');

% Get the new value from the edit box
new_val_str = get(h, 'String');
new_val = str2double(new_val_str);

% Update the appropriate parameter based on the tag
switch tag
    case 'nhashes_box'
        % Validate input: must be a positive integer
        if ~isnan(new_val) && new_val > 0 && floor(new_val) == new_val
            Nhashes = new_val;
        else
            % If invalid, revert the string in the box to the old value
            set(h, 'String', num2str(Nhashes));
            return; % Exit without re-initializing
        end

    case 'nbuckets_box'
        % Validate input: must be a positive integer
        if ~isnan(new_val) && new_val > 0 && floor(new_val) == new_val
            Nbuckets_per_hash = new_val;
        else
            set(h, 'String', num2str(Nbuckets_per_hash));
            return;
        end

    case 'hashstride_box'
        % Validate input: must be a positive integer
        if ~isnan(new_val) && new_val > 0 && floor(new_val) == new_val
            hash_stride = new_val;
        else
            set(h, 'String', num2str(hash_stride));
            return;
        end
end

% Re-initialize the CMAC with the new parameters
reinit_cmac;
