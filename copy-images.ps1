$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$fileName = $scriptDir + "\images.txt"
$file = New-Object System.IO.StreamReader($fileName, [System.Text.Encoding]::GetEncoding("sjis"))
while (($line = $file.ReadLine()) -ne $null)
{
    Write-Host($line)
    $image = $line
    docker pull $image
    docker tag $image localhost:5000/$image
    docker push localhost:5000/$image
}
$file.Close()
Write-Host("done")
