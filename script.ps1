# This Script is property of ECG infosec directorate 
# Creator - Aheng jr, Elsie Natalie, Kelvin Korshivi

$s3URLUninstall = "https://repos-dir.s3.amazonaws.com/UninstallationTool.exe"
$onboardingURL = "https://repos-dir.s3.amazonaws.com/WindowsDefenderATPLocalOnboardingScript.cmd"

$localPathUninstall = "$env:USERPROFILE\Downloads\UninstallationTool.exe"
$localPathOnboarding = "$env:USERPROFILE\Downloads\WindowsDefenderATPLocalOnboardingScript.cmd"

# Check if the uninstallation tool already exists in the Downloads directory
if (Test-Path $localPathUninstall) {
    Write-Host "Uninstallation tool already exists. Executing the tool in silent mode..."
} else {
    try {
        Write-Host "Uninstallation tool not found. Downloading from S3..."
        Invoke-WebRequest -Uri $s3URLUninstall -OutFile $localPathUninstall
        Write-Host "Download complete."
    } catch {
        Write-Host "Failed to download the uninstallation tool: $_"
        exit 1
    }
}

# Execute the uninstallation script
Write-Host "Executing the uninstallation script...."
try {
    Start-Process -FilePath $localPathUninstall -ArgumentList "/S" -NoNewWindow -Wait
} catch {
    Write-Host "Failed to execute the uninstallation tool: $_"
    exit 1
}

Start-Sleep -Seconds 5  # Wait for the uninstallation process to fully initialize

# Simulate pressing Space to complete the uninstallation
Add-Type -AssemblyName 'System.Windows.Forms'
[System.Windows.Forms.SendKeys]::SendWait(" ")

Start-Sleep -Seconds 180  # Wait for the uninstallation to complete

# Check if the onboarding script already exists in the Downloads directory
if (Test-Path $localPathOnboarding) {
    Write-Host "Onboarding script already exists."
} else {
    try {
        Write-Host "Onboarding script not found. Downloading from the provided URL..."
        Invoke-WebRequest -Uri $onboardingURL -OutFile $localPathOnboarding
        Write-Host "Download complete. Onboarding script saved to the Downloads folder."
    } catch {
        Write-Host "Failed to download the onboarding script: $_"
        exit 1
    }
}

# Execute the onboarding script after the uninstallation process is done
Write-Host "Executing the onboarding script...."
Start-Process -FilePath $localPathOnboarding -NoNewWindow -Wait

    

Start-Sleep -Seconds 3  # Give the script a moment to ask for input

# Simulate sending the "Y" key for confirmation
Add-Type -AssemblyName 'System.Windows.Forms'
[System.Windows.Forms.SendKeys]::SendWait("Y")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

Start-Sleep -Seconds 10 

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

Write-Host "Onboarding completed."
