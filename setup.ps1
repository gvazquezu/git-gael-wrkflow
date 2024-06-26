#Instalación de Hugo en caso de no estarlo
if (!(Test-Path "$env:ProgramFiles/Hugo/hugo.exe")) {
    Invoke-WebRequest -Uri "https://github.com/gohugoio/hugo/releases/udownload/v0.81.0/hugo_extended"
    Expand-Archive -Path "hugo.zip" -DestinationPath "$env:ProgramFiles/Hugo"
    Remove-Item "hugo.zip"
}

#Instalación de otras herramietntaas

#Instalación de Shellcheck
if (!(Get-Command shellcheck -ErrorAction SilentlyContinue)){
    choco install shellcheck -y
}