export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

./ethdcrminer64 -epool eth-us-west1.nanopool.org:9999 -ewal 0xa90221e1ee66582dfd1bafc7c534e9e7ed6ab7ea/avenger/pravinpuma@gmail.com -epsw x -dpool stratum+tcp://sia-us-west1.nanopool.org:7777 -dwal 9b6f6f2ea74fcefe1fef1dfa49c1a2ffecfc301db09602df8827ec25ceaeeb7da0ad9a706ce7/avenger/pravinpuma@gmail.com -dcoin sia -ftime 10
