@echo off
TITLE Mindsmith GitHub Configuration
echo =========================================================
echo 🔗 CONFIGURACIÓN DE REPOSITORIO REMOTO
echo =========================================================

echo 1. Crea un repositorio en https://github.com/new (Sin README ni .gitignore)
echo 2. Copia la URL que termine en .git

set /p github_url="👉 Pega aquí la URL de tu repositorio de GitHub: "

if "%github_url%"=="" (
    echo [ERROR] No has introducido ninguna URL.
    pause
    exit
)

echo [INFO] Vinculando con GitHub...
git remote add origin %github_url%

echo [INFO] Subiendo archivos por primera vez...
git branch -M main
git push -u origin main

echo =========================================================
echo ✅ TODO LISTO.
echo A partir de ahora puedes usar 'SYNC_GITHUB.bat' para tus cambios diarios.
echo =========================================================
pause
