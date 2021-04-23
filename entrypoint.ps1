$ErrorActionPreference = "Stop"

Import-Module sandersaares.devops-scripts

$path = Join-Path $env:GITHUB_WORKSPACE $env:INPUT_ASSEMBLYINFOPATH

$version = Set-DotNetBuildAndVersionStrings -assemblyInfoPath $path -commitId $ENV:GITHUB_SHA -primaryBranchName $env:INPUT_PRIMARYBRANCH