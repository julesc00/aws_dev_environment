add-content -path c:/Users/your_user/.ssh/config -value @'

Host ${hostname}
    Hostname ${hostname}
    User ${user}
    IdentityFile ${identityfile}
'@