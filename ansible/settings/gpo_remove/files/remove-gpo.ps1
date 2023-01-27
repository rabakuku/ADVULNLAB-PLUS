Remove-GPLink -Name "NorthWallpaper" -Target "OU=North,OU=kingdoms,DC=newyork,DC=local" -erroraction 'silentlycontinue'

#if (!(Get-ItemPropertyValue -Path "HKCU:\Control Panel\Desktop\" -Name "Wallpaper")) { Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value "c:\windows\web\wallpaper\windows\img0.jpg"  }
#

$gpo_exist=Get-GPO -Name "Remove-NorthWallpaper" -erroraction ignore
if ($gpo_exist) {
Remove-GPO -Name "Remove-NorthWallpaper"
}

New-GPO -Name "Remove-NorthWallpaper"-comment "Remove NorthWallpaper"
New-GPLink -Name "Remove-NorthWallpaper" -Target "OU=North,OU=kingdoms,DC=newyork,DC=local"

Set-GPPrefRegistryValue -Name "Remove-NorthWallpaper" -Context User -Action Delete -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"

Set-GPPrefRegistryValue -Name "Remove-NorthWallpaper" -Context User -Action Delete -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\CurrentVersion"

