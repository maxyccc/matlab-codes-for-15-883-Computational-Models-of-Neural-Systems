% sequential_buckets

% Fair sequential buckets - distribute across full memory space
bins_assigned = cell(360,1);
% Ensure stride is at least 1 to avoid collapsing to a single cell
memory_stride = max(1, floor(Memsize / (Nhashes * Nbuckets_per_hash)));

for z = 0:359
  % Match the wrap-around logic used in random_buckets so each input
  % activates one bucket per hash (i.e., a full set of cells), not just one.
  c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );
  % Map bucket indices to distributed memory locations deterministically
  memory_locations = mod((c-1) * memory_stride, Memsize) + 1;
  bins_assigned{z+1} = memory_locations;
end