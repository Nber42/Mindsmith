@echo off
TITLE Mindsmith GitHub Sync
echo =========================================================
echo 🔄 SINCRONIZANDO CRM CON GITHUB
echo =========================================================

:: 1. Verificar si git está instalado
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git no está instalado. Instálalo desde https://git-scm.com/
    pause
    exit
)

:: 2. Añadir todos los cambios
echo [INFO] Preparando cambios...
git add .

:: 3. Commit de los cambios
set msg=Actualizacion automatica %date% %time%
echo [INFO] Guardando cambios localmente...
git commit -m "%msg%"

:: 4. Intentar recibir cambios de otros (Pull)
echo [INFO] Buscando actualizaciones del equipo...
git pull origin main

:: 5. Subir cambios (Push)
echo [INFO] Subiendo tus cambios a GitHub...
git push origin main

echo =========================================================
echo ✅ PROCESO FINALIZADO
echo =========================================================
pause
