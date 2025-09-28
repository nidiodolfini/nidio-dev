# Script para iniciar o servidor de desenvolvimento com drafts
Write-Host "Iniciando servidor de desenvolvimento com drafts..."

# Para o servidor anterior se estiver rodando
$hugoProcesses = Get-Process -Name "hugo" -ErrorAction SilentlyContinue
if ($hugoProcesses) {
    Write-Host "Parando servidor anterior..."
    $hugoProcesses | Stop-Process -Force
}

# Inicia o servidor com drafts
hugo server --bind 0.0.0.0 --port 1315 --buildDrafts
