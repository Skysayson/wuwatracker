<#
  Original script was based on: https://github.com/codewithmei/wuwa.mei-labs.com

  This script should be copy-pasted into Powershell AFTER opening Convene History, otherwise it will throw an error.

  $gamePath - is the folder where Wuthering Waves is installed, the default folder is named "Wuthering Waves Game".
#>
$gamePath="C:\Program Files\Epic Games\WutheringWavesj3oFh\Wuthering Waves Game";
$logFile="$gamePath\Client\Saved\Logs\Client.log";if(-not(Test-Path $logFile)){Write-Host "`nThe file '$logFile' does not exist." -ForegroundColor Red;Write-Host "Did you set your Game Installation Path properly?" -ForegroundColor Magenta;Read-Host "Press any key to exit";exit}$latestUrlEntry=Get-Content $logFile|Select-String -Pattern "https://aki-gm-resources-oversea.aki-game.net|https://aki-gm-resources.aki-game.com"|Select-Object -Last 1;if($null-ne $latestUrlEntry){$urlPattern='url":"(.*?)"';$url=[regex]::Match($latestUrlEntry.ToString(),$urlPattern).Groups[1].Value;if($url){Write-Host "`nConvene Record URL: $url";Set-Clipboard $url;Write-Host "`nURL copied to clipboard. Please paste to Wuwa Tracker and click the Import History button." -ForegroundColor Green}else{Write-Host "No URL found."}}else{Write-Host "`nNo matching entries found in the log file. Please open your Convene History first!" -ForegroundColor Red}
