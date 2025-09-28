# Script de build que executa o Hugo e remove posts em draft
Write-Host "Iniciando build do Hugo..."

# Executa o build do Hugo
hugo --minify

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build do Hugo concluído com sucesso!"
    
    # Remove posts em draft
    Write-Host "Removendo posts em draft..."
    & ".\scripts\remove-drafts.ps1"
    
    Write-Host "Build completo!"
} else {
    Write-Host "Erro no build do Hugo!"
    exit 1
}
