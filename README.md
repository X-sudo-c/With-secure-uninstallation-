Windows Defender Onboarding & Uninstallation Automation Script
Overview

This PowerShell script is designed to automate the process of:

    Checking for the presence of an uninstallation tool and downloading it if necessary.
    Running the uninstallation tool in silent mode.
    Simulating user input to complete the uninstallation.
    Checking for the presence of the Windows Defender onboarding script, downloading it if necessary.
    Running the onboarding script, including automating the user input for confirmation prompts.

Script Authors

    Aheng Jr

Script Details
Purpose

This script streamlines the process of uninstalling a specified program and onboarding to Windows Defender by automating the following tasks:

    Automatically downloading required executables (uninstallation tool and onboarding script) if they do not exist in the Downloads directory.
    Running these tools and automating user input (such as confirming actions by pressing Enter and Y).

Requirements

    PowerShell: The script is written in PowerShell and should be executed in a Windows environment.
    Internet Access: Required to download the uninstallation tool and Windows Defender onboarding script from S3.

Key Features

    Automatically checks for and downloads necessary files from S3.
    Runs the uninstallation tool silently (/S flag).
    Automates user inputs for confirmation (e.g., pressing Enter and Y keys).
    Executes the onboarding script after the uninstallation is complete.

Script Components

    Uninstallation Tool: The script checks if the uninstallation tool exists in the Downloads folder. If it doesn’t, it will download it from an S3 bucket and then run the uninstallation tool in silent mode.

    Windows Defender Onboarding Script: The script checks for the presence of the Windows Defender onboarding script in the Downloads folder. If it’s missing, the script will download it and execute it. The script also simulates pressing Y and Enter to confirm any required input.

Script Flow

    Uninstallation:
        Check if the uninstallation tool exists in the Downloads folder.
        Download the tool from the S3 URL if it’s not found.
        Run the tool in silent mode and press Enter to confirm completion.

    Onboarding:
        Check if the Windows Defender onboarding script exists in the Downloads folder.
        Download the script from the S3 URL if it’s not found.
        Execute the onboarding script and simulate pressing Y and Enter as prompted.

How to Use

    Download or copy the PowerShell script to your local machine.
    Open PowerShell as an Administrator.
    Navigate to the directory where the script is saved.
    Run the script:

    powershell

    ./scriptName.ps1

    The script will check for the necessary tools and download them if they’re missing, then automate the uninstallation and onboarding processes.

Important Notes

    Ensure that you have internet access as the script requires downloading the uninstallation tool and onboarding script from the specified S3 URLs.
    The script automates user input using SendKeys, so make sure no other programs interfere with the window focus while the script is running.

License

This script is the property of ECG Infosec Directorate.

This README.md explains the script’s functionality, usage, and requirements. You can modify or expand the details based on any additional features or changes in the script.


ChatGPT can make mistakes. Check important info.
