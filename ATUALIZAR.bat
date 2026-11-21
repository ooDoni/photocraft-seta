<# : batch
@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ([IO.File]::ReadAllText('%~f0'))"
echo.
pause
goto :eof
: fim do batch, comeco do PowerShell #>

# Baixa a versao mais nova do PhotoCraft (Seta), compilada no GitHub, e cria o atalho.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo   = '__REPO__'
$AppDir = Join-Path $env:LOCALAPPDATA 'PhotoCraft-Seta\app'
$Exe    = Join-Path $AppDir 'PhotoCraft-Seta.exe'
$Stamp  = Join-Path $AppDir 'versao.txt'
try {
  Write-Host 'PhotoCraft (Seta) - atualizar' -ForegroundColor Yellow
  $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest" -Headers @{ 'User-Agent' = 'photocraft-seta' } -UseBasicParsing
  $asset = $rel.assets | Where-Object { $_.name -eq 'PhotoCraft-Seta.exe' } | Select-Object -First 1
  if (-not $asset) { throw 'A versao mais nova ainda nao tem o PhotoCraft-Seta.exe.' }
  $have = ''
  if ((Test-Path $Exe) -and (Test-Path $Stamp)) { $have = (Get-Content $Stamp -Raw).Trim() }
  if ($have -eq $rel.tag_name) {
    Write-Host "Ja esta na versao mais nova ($($rel.tag_name))." -ForegroundColor Green
  } else {
    while (Get-Process -Name 'PhotoCraft-Seta' -ErrorAction SilentlyContinue) {
      Read-Host 'Feche o PhotoCraft (Seta) e aperte Enter' | Out-Null
    }
    New-Item -ItemType Directory -Force -Path $AppDir | Out-Null
    Write-Host "Baixando $($rel.tag_name) ($([Math]::Round($asset.size / 1MB)) MB)..."
    $tmp = "$Exe.baixando"
    Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $tmp -UseBasicParsing
    Move-Item -Force $tmp $Exe
    Set-Content -Path $Stamp -Value $rel.tag_name
    $desktop = [Environment]::GetFolderPath('Desktop')
    $sc = (New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $desktop 'PhotoCraft (Seta).lnk'))
    $sc.TargetPath = $Exe
    $sc.WorkingDirectory = $AppDir
    $sc.IconLocation = "$Exe,0"
    $sc.Description = 'PhotoCraft com a ferramenta Seta Curva'
    $sc.Save()
    Write-Host ''
    Write-Host "Pronto! PhotoCraft (Seta) $($rel.tag_name) instalado. Abra pelo atalho na Area de Trabalho." -ForegroundColor Green
    if ($rel.body) { Write-Host ''; Write-Host $rel.body }
  }
} catch {
  Write-Host ''
  Write-Host "ERRO: $_" -ForegroundColor Red
}
