FROM mcr.microsoft.com/powershell

RUN pwsh -c '$ProgressPreference = "SilentlyContinue"; Install-Module sandersaares.devops-scripts -Scope AllUsers -Force'

WORKDIR /action
COPY *.ps1 .

ENTRYPOINT ["pwsh", "-c", "& /action/entrypoint.ps1"]