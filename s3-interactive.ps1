# ===========================
# Simple Rclone LSD Tool
# ===========================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "=== Rclone S3 - Listing des buckets ===" -ForegroundColor Cyan
Write-Host ""

# --- Vérification rclone
#if (-not (Get-Command rclone -ErrorAction SilentlyContinue)) {
#   Write-Host "ERREUR : rclone n'est pas dans le PATH" -ForegroundColor Red
#    Read-Host "Appuyez sur Entrée pour fermer"
#    exit 1
#}

# --- Saisie interactive
$config = Read-Host "Nom de la configuration rclone"
$accessKey = Read-Host "Access Key"
$secretKey = Read-Host "Secret Key"
$drive = Read-Host "Lettre montage réseau"

if ([string]::IsNullOrWhiteSpace($config)) {
    Write-Host "ERREUR : nom de config vide" -ForegroundColor Red
    Read-Host "Appuyez sur Entrée pour fermer"
    exit 1
}

# --- Passage des credentials via variables d'environnement
$env:AWS_ACCESS_KEY_ID     = $accessKey
$env:AWS_SECRET_ACCESS_KEY = $secretKey

Write-Host ""
Write-Host "Listing des buckets pour la config '$config'..."
Write-Host ""

try {
    ./rclone.exe mount $config":" $drive --vfs-cache-mode full --links
} catch {
    Write-Host ""
    Write-Host "ERREUR rclone :" -ForegroundColor Red
    Write-Host $_
}

Write-Host ""
Read-Host "Fin - Appuyez sur Entrée pour fermer"