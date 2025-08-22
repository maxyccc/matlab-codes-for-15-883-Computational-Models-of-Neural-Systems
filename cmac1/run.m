% 1-Dimensionala CMAC simulation.

% Copyright (c) 1997, 2005 by David S. Touretzky.
% Carnegie Mellon University

% We're encoding a circular variable whose values are integers in
% [1,360].  We divide the circle into 11 regions (hash buckets).
% We'll construct 32 separate encodings; the starting position of each
% encoding will be offset by 2 from the previous encoding.

% This scheme uses at most 11*32 = 352 memory locations out of 4096.
% The actual number used may be lower, due to collisions.

% Declare key parameters as global so they can be modified by GUI controls

last_point = [];

Memsize = 4096;
Nhashes = 32;
Nbuckets_per_hash = 11;
hash_stride = 2;

g_val = 1;
Tolerance = 0.01;

xcoords = 0:359;
ycoords = sin(xcoords*pi/180);

bucket_mode = 1;  % 1 for randomly drawn buckets; 2 for systematically ordered

cmac_memory = zeros(Memsize,1);

setup_buckets

% Reset the simulation state
reset_cmac
