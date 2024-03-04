[string]$SolutionFolder = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path);

Get-ChildItem -recurse $SolutionFolder -include *.sln,*.cs,*.csproj,*.config,*.ps1,*.json,*.tsx,*.cshtml,*.props,*.razor,*.json,*.html,*.js | where { $_ -is [System.IO.FileInfo] } | where { !$_.FullName.Contains("\packages\") } | where { !$_.FullName.Contains("\obj\") } | where { !$_.FullName.Contains("package.json") } | where { !$_.Name.Equals("_SetApplicationName.ps1") } |
Foreach-Object {
    Set-ItemProperty $_.FullName -name IsReadOnly -value $false
    [string]$Content = [IO.File]::ReadAllText($_.FullName)
    $Content = $Content.Replace('BlazorNet8', 'BlazorNet8')
    [IO.File]::WriteAllText($_.FullName, $Content, [System.Text.Encoding]::UTF8)
}
