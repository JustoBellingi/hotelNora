# Script de configuracion - Hotel Nora
# Crea la carpeta images/ y copia las fotos al proyecto
# Ejecutar una sola vez desde PowerShell

$origen = "C:\Users\2020\AppData\Roaming\Claude\local-agent-mode-sessions\b73d922c-f82b-47d7-8b9a-3234ba8a2010\fc880c78-06f1-4370-91ba-924d89f8930b\local_ee75c9ee-d71d-4386-8a85-aed48f5e8876\uploads"
$destino = "$PSScriptRoot\images"

if (-not (Test-Path $destino)) {
    New-Item -ItemType Directory -Path $destino | Out-Null
    Write-Host "Carpeta 'images' creada."
}

$fotos = @(
    "Foto.jpg", "Foto-3.jpg", "Foto-8.jpg", "Foto-9.jpg",
    "Foto-12.jpg", "Foto-13.jpg", "Foto-14.jpg", "Foto-19.jpg",
    "Foto-27.jpg", "Foto-31.jpg", "Foto-33.jpg", "Foto-34.jpg",
    "Foto-42.jpg", "Foto-48.jpg", "Foto-55.jpg", "Foto-67.jpg",
    "Foto-71.jpg", "Foto-73.jpg"
)

$copiadas = 0
foreach ($foto in $fotos) {
    $src = Join-Path $origen $foto
    $dst = Join-Path $destino $foto
    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        $copiadas++
        Write-Host "  Copiada: $foto"
    } else {
        Write-Host "  No encontrada: $foto" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "$copiadas fotos copiadas a la carpeta images/." -ForegroundColor Green
Write-Host "Ya podes abrir index.html en el navegador." -ForegroundColor Green
