function New-LogFile {
    param (
        [string]$FilePath
    )

    if ($(Test-Path $FilePath)) {
        New-Item -Force -Path $FilePath -ItemType File | Out-Null
        Write-Output "Création du fichier $FilePath"
    }
    
}


function Write-LogFile {
    [CmdletBinding()]
    param(
        [string]$Text,
        [string]$FilePath,
        [switch]$LogToSTDOut=$false
    )
    New-LogFile($FilePath)

    if ($LogToSTDOut) {Write-Output $Text}
    Write-Output $Text | Out-File -FilePath $($FilePath) -Append -Encoding utf8

}

function Clear-LogFile {
    [CmdletBinding()]
    param(
        [string]$FilePath
    )
    New-LogFile($FilePath)

    Write-Output "" | Out-File -FilePath $FilePath -NoNewline
}



Export-ModuleMember -Function Clear-LogFile,Write-LogFile