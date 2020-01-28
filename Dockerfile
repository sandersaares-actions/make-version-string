FROM sandersaares/github-actions-baseimage

WORKDIR /action
COPY *.ps1 .

ENTRYPOINT ["pwsh", "-c", "& /action/entrypoint.ps1"]