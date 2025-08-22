% setup_buckets.m

bucketsize = floor(360/Nbuckets_per_hash);

% Calculate base bucket boundaries and offsets
base_bmin = bucketsize * (0:Nbuckets_per_hash-1);
offsets = hash_stride * (0:Nhashes-1)';

% Create bucket boundaries for all hashes
bmin = repmat(base_bmin, Nhashes, 1) + repmat(offsets, 1, Nbuckets_per_hash);
bmax = bmin + bucketsize - 1;

% For each hash, grab a set of bins at random from the pool.
buckets = [];
for i = 1:Nhashes
  cands = randperm(Memsize);
  buckets(i,:) = cands(1:Nbuckets_per_hash);
end

% Flatten arrays for easier processing
bmin = bmin(:);
bmax = bmax(:);
buckets = buckets(:);

% Apply the appropriate bucket assignment strategy
if bucket_mode == 1
  random_buckets
else
  sequential_buckets
end
