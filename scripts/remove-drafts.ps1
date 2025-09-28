# Script para remover posts em draft do diretório público
# Este script identifica automaticamente os posts em draft e os remove

Write-Host "Identificando e removendo posts em draft..."

# Busca por arquivos de conteúdo com draft: true
$contentFiles = Get-ChildItem -Path "content/posts" -Filter "*.md" -Recurse

foreach ($file in $contentFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Verifica se o arquivo contém draft: true
    if ($content -match "draft:\s*true") {
        # Extrai o título do post para gerar o slug
        if ($content -match "title:\s*['""]([^'""]+)['""]") {
            $title = $matches[1]
            # Converte o título para slug (remove acentos, espaços, etc.)
            $slug = $title -replace '[^\w\s-]', '' -replace '\s+', '-' -replace '-+', '-' -replace '^-|-$', ''
            $slug = $slug.ToLower()
            
            $postPath = "public/posts/$slug"
            if (Test-Path $postPath) {
                Write-Host "Removendo post em draft: $slug"
                Remove-Item -Path $postPath -Recurse -Force
            }
        }
    }
}

Write-Host "Posts em draft removidos com sucesso!"