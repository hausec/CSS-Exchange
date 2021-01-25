function Invoke-DisableDiagnosticsLogging {

    Write-Host " "  $nl
    Get-Date
    Write-Host "Disabling Diagnostics Logging..." -ForegroundColor green $nl
    Write-Host "--------------------------------------------------------------------------------------------------------------"
    " "
    Set-EventLogLevel 'MSExchange Repl\Service' -level lowest
    $disgetReplSvc = Get-EventLogLevel 'MSExchange Repl\Service'
    Write-Host "$($disgetReplSvc.Identity) - $($disgetReplSvc.EventLevel) $nl"

    Set-EventLogLevel 'MSExchange Repl\Exchange VSS Writer' -level lowest
    $disgetReplVSSWriter = Get-EventLogLevel 'MSExchange Repl\Exchange VSS Writer'
    Write-Host "$($disgetReplVSSWriter.Identity) - $($disgetReplVSSWriter.EventLevel) $nl"

    if ($exchVer -eq "2010") {
        Set-EventLogLevel 'MSExchangeIS\9002 System\Backup Restore' -level lowest
        $disgetBackRest = Get-EventLogLevel 'MSExchangeIS\9002 System\Backup Restore'
        Write-Host "$($disgetBackRest.Identity) - $($disgetBackRest.EventLevel) $nl"
    }
}