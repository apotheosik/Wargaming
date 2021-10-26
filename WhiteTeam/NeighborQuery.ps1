#Chris Sequeira 18 October 2021 
#Powershell for ping sweep etc 

Get-NetNeighbor | Select-Object -Property IPAddress | ForEach-Object {
    if (Test-Connection -TargetName $_ -Count 1 -ea 0 -quiet){
        echo "$_ is available."
        }
    else {
        echo "$_ is unavailable."
        }
    }
#____________________________________________________________________________________
