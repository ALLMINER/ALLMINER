param(
    [Parameter(Mandatory = $true)]
    [String]$Querymode = $null ,
    [Parameter(Mandatory = $false)]
    [pscustomobject]$Info
    )

#. .\..\Include.ps1

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName
$ActiveOnManualMode    = $true
$ActiveOnAutomaticMode = $true
$ActiveOnAutomatic24hMode = $true
$AbbName = 'alt'
$WalletMode ='WALLET'
$Result = @()




#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************

if ($Querymode -eq "info"){
    $Result = [PSCustomObject]@{
                    Disclaimer = "Autoexchange to @@currency coin specified in config.txt, no registration required"
                    ActiveOnManualMode=$ActiveOnManualMode  
                    ActiveOnAutomaticMode=$ActiveOnAutomaticMode
                    ActiveOnAutomatic24hMode=$ActiveOnAutomatic24hMode
                    ApiData = $True
                    AbbName=$AbbName
                    WalletMode=$WalletMode
                         }
    }






#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************



    if ($Querymode -eq "wallet")    {
        
                            
                            try {
                                $http="https://altminer.net/api/wallet?address="+$Info.user
                                $ALT_Request = Invoke-WebRequest -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36"  $http -UseBasicParsing -timeoutsec 10 | ConvertFrom-Json 
                            }
                            catch {}
        
        
                            if ($ALT_Request -ne $null -and $ALT_Request -ne ""){
                                $Result = [PSCustomObject]@{
                                                        Pool =$name
                                                        currency = $alt_Request.currency
                                                        balance = $ALT_Request.balance
                                                    }
                                    remove-variable ALT_Request                                                                                                        
                                    }

                        
                        }
                        
                        


#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
    
if (($Querymode -eq "core" ) -or ($Querymode -eq "Menu")){

        $retries=1
                do {
                        try {
                            $alT_Request = Invoke-WebRequest "https://altminer.net/api/status"  -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36" -UseBasicParsing -timeout 5 | ConvertFrom-Json 

                        }
                        catch {}
                        $retries++
                    if ($ALT_Request -eq $null -or $ALT_Request -eq "") {start-sleep 5}
                    } while ($ALT_Request -eq $null -and $retries -le 3)
                
                if ($retries -gt 3) {
                                    WRITE-HOST 'Altminer API NOT RESPONDING...ABORTING'
                                    EXIT
                                    }



                  

                $ALT_Request | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {
                    
                                            $Divisor = (Get-Algo-Divisor $_) / 1000

                                            switch ($_){
                                                "X11"{$Divisor *= 1000}
                                                "qubit"{$Divisor *= 1000}
                                                "quark"{$Divisor *= 1000}
                                                "blakecoin"{$Divisor *= 1000}
                                                }

                    
                                    
                                  $Result+=[PSCustomObject]@{
                                Algorithm     = $alt_Algorithm
                                Info          = $alt_coin
                                Price         = [Double]$coin.estimate / $Divisor
                                Price24h      = [Double]$coin.actual_last24h / $Divisor
                                Protocol      = "stratum+tcp"
                                Host          = "eu1.altminer.net"
                                Port          = $coin.port
                                User          = $CoinsWallets.get_item($alt_Symbol)
                                Pass          = "c=$alt_symbol,ID=#WorkerName#"
                                Location      = 'US'
                                SSL           = $false
                                Symbol        = $alt_Symbol
                                AbbName       = $AbbName
                                ActiveOnManualMode    = $ActiveOnManualMode
                                ActiveOnAutomaticMode = $ActiveOnAutomaticMode
                                PoolWorkers       = $coin.Workers
                                PoolHashRate  = $coin.HashRate
                                Blocks_24h    = $coin."24h_blocks"
                                WalletMode    = $WalletMode
                                Walletsymbol = $alt_Symbol
                                PoolName = $Name
                                Fee = ($alt_Request.($coin.algo).Fees)/100
                                }
                                        
                                    }
                                }
  remove-variable ALT_Request    
