param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ReportArgs = @()
)

. "$PSScriptRoot/aw-fix-gaps-win"

$scriptPath = "$PSScriptRoot/aw-linux-data.ps1"
$wtArgs = [System.Collections.Generic.List[string]]::new()
$wtArgs.Add('-w')
$wtArgs.Add('0')
$wtArgs.Add('new-tab')
$wtArgs.Add('--title')
$wtArgs.Add('AW Linux Report')
$wtArgs.Add('pwsh')
$wtArgs.Add('-NoExit')
$wtArgs.Add('-ExecutionPolicy')
$wtArgs.Add('Bypass')
$wtArgs.Add('-File')
$wtArgs.Add("$PSScriptRoot/aw-linux-data.ps1")
& wt @wtArgs

sleep 2

push-location G:\home\hugoc\Documents\git2\aw-report
$env:UV_PROJECT_ENVIRONMENT="C:\Users\hugoc\AppData\Local\Temp\aw-report-venv"
uv sync

write-host "Linux usage (port 5702)" -ForegroundColor Green
uv run aw-report.py --server-port 5702 @ReportArgs

write-host "Windows usage (port 5600)" -ForegroundColor Yellow
uv run aw-report.py --server-port 5600 @ReportArgs
pop-location