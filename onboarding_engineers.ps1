# ==================================================
# SESSION 13: THE COMPLETED ONBOARDING
# ==================================================

Write-Host "[*] Beginning Engineering Onboarding..." -ForegroundColor Cyan

$TargetOU = "OU=Engineering,DC=titan,DC=local"

# INSTRUCTION 1: Create a loop (For 1 to 50)
for ($i = 1; $i -le 50; $i++) {

    $UserName = "Eng_user$i"
    $PassText = "Tempest0707$i"
    $SecurePass = ConvertTo-SecureString -String $PassText -AsPlainText -Force
    try {
        if (Get-ADUser -Filter "SamAccountName -eq '$UserName'" -ErrorAction SilentlyContinue) { 
            Write "[-] Skipping $UserName (Already exist)" -ForegroundColor Yellow
        }
        else
         New-ADUser -Name $UserName `
                   -SamAccountName $UserName `
                   -UserPrincipalName "$UserName@titan.local" `
                   -Path $TargetOU `
                   -AccountPassword $SecurePass `
                   -ChangePasswordAtLogon $true `
                   -Enabled $true
        
        Write-Host "[+] Created and Enabled: $UserName" -ForegroundColor Green
    }
    catch {
        Write-Warning "[-] Failed to create $UserName. Error: $($_.Exception.Message)"
    }
}

Write-Host "`n[*] VALIDATION: Current Users in Engineering" -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase $TargetOU | Select-Object Name, Enabled | Format-Table -AutoSize


Write-Host "[+] All engineers onboarded successfully."
