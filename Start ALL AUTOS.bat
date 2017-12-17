setx GPU_FORCE_64BIT_PTR 1
 
setx GPU_MAX_HEAP_SIZE 100

setx GPU_USE_SYNC_OBJECTS 1

setx GPU_MAX_ALLOC_PERCENT 100

setx GPU_SINGLE_ALLOC_PERCENT 100


powershell -version 5.0 -noexit -executionpolicy bypass -command "&.\core.ps1   -Miningmode Automatic -PoolsName AHASHPOOL,MINING_POOL_HUB,ZPOOL