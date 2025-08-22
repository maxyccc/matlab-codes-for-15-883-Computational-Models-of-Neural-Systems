% plot_buckets.m

% --- Update Tiling/Bucket Visualization ---

% First, reset all buckets to the inactive color
inactive_color = [0.4 0.4 0.4];
for i = 1:length(g_h_hist_bars)
    if ~isempty(g_h_hist_bars{i})
        set(g_h_hist_bars{i}, 'FaceColor', inactive_color);
    end
end

% If a point has been selected, highlight the active buckets
if ~isempty(last_point)
    % Find active buckets for the last selected point
    z = last_point;
    c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );

    % Set active buckets to the highlight color
    active_color = 'y';
    for i = 1:length(c)
        idx = c(i);
        if ~isempty(g_h_hist_bars{idx})
            set(g_h_hist_bars{idx}, 'FaceColor', active_color);
        end
    end
end
drawnow;
