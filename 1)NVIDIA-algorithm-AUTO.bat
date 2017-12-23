setx GPU_FORCE_64BIT_PTR 1
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100
powershell -version 5.0 -noexit -executionpolicy bypass -command "&.\core.ps1   -miningmode Automatic -PoolsName MINING_POOL_HUB,ZPOOL,ahashpool -algorithm blake2s,phi,x17,ethash,neoscrypt,cryptonight,skunk,lyra2z,xevan,lyra2v2,nist5,veltor,blakecoin,hsr,timetravel,c11,lbry,equihash,x11gost,x11evo,blake2b,blake14r,bitcore,groestl,skein,keccak,MYRIAD-GROESTL,polytimos,xevan,keccakc 