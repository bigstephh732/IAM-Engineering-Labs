Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"

$PasswordProfile = @{Password="TempPassword123!";ForceChangePasswordNextSignIn=$true}

$user = New-MgUser -DisplayName "IAM Lab User" -MailNickname "iamlabuser" -UserPrincipalName "iamlabuser@soclab2026.onmicrosoft.com" -PasswordProfile $PasswordProfile -AccountEnabled:$true

$group = New-MgGroup -DisplayName "IAM-Lab-Group" -MailEnabled:$false -MailNickname "IAMLabGroup" -SecurityEnabled

New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id

Write-Host "User created and assigned to group"

Update-MgUser -UserId $user.Id -Department "Security Engineering"

Write-Host "User role updated"

Update-MgUser -UserId $user.Id -AccountEnabled:$false

Remove-MgGroupMemberByRef -GroupId $group.Id -DirectoryObjectId $user.Id

Write-Host "User disabled and access removed"
