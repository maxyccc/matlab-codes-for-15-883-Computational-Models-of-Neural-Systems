
% --- Create axes for Tiling/Bucket Visualization ---
ax_hist = axes('Position',[0.15 0.15 0.75 0.10]);
hold on;
xlabel('Buckets in Input Space (0-359)');
ylabel('Hash #');
set(ax_hist, 'YDir', 'reverse'); % Puts hash 1 at the top
axis([0 359 0 Nhashes+1]);
box on;
set(ax_hist, 'XColor', 'w', 'YColor', 'w');

% --- Draw the buckets for each hash ---
g_h_hist_bars = cell(Nhashes * Nbuckets_per_hash, 1);
bmin_matrix = mod(reshape(bmin, Nhashes, Nbuckets_per_hash), 360);
bmax_matrix = mod(reshape(bmax, Nhashes, Nbuckets_per_hash), 360);
inactive_color = [0.4 0.4 0.4];

for i = 1:Nhashes
  for j = 1:Nbuckets_per_hash
    x_min = bmin_matrix(i,j);
    x_max = bmax_matrix(i,j);
    y_pos = i - 0.4;
    height = 0.8;

    idx = sub2ind([Nhashes, Nbuckets_per_hash], i, j);

    if x_min > x_max % Handle wrap-around buckets
      % Draw part 1 (from x_min to end)
      p1 = patch([x_min 359 359 x_min], [y_pos y_pos y_pos+height y_pos+height], inactive_color);
      % Draw part 2 (from start to x_max)
      p2 = patch([0 x_max x_max 0], [y_pos y_pos y_pos+height y_pos+height], inactive_color);
      g_h_hist_bars{idx} = [p1, p2];
    else
      p = patch([x_min x_max x_max x_min], [y_pos y_pos y_pos+height y_pos+height], inactive_color);
      g_h_hist_bars{idx} = p;
    end
  end
end