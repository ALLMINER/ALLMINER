setx GPU_FORCE_64BIT_PTR 1
 
setx GPU_MAX_HEAP_SIZE 100

setx GPU_USE_SYNC_OBJECTS 1

setx GPU_MAX_ALLOC_PERCENT 100

setx GPU_SINGLE_ALLOC_PERCENT 100


powershell -version 5.0 -noexit -executionpolicy bypass -command "&.\core.ps1   -Miningmode Automatic -PoolsName AHASHPOOL,MINING_POOL_HUB,ZPOOL -algorithm blake2s,phi,x17,ethash,neoscrypt,cryptonight,skunk,lyra2z,xevan,lyra2v2,nist5,veltor,blakecoin,hsr,c11,lbry,equihash,x11ghost,blake2b,blake14r,bitcore,groestl,keccak,skein,MYRIAD-GROESTL,polytimos,xevan,keccakc