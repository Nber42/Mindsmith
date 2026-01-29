@echo off
TITLE Mindsmith CRM Launcher
echo =========================================================
echo 🚀 INICIANDO MINDSMITH CRM PARA EQUIPOS
echo =========================================================

:: 1. Comprobar si Node.js está instalado
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js no está instalado. 
    echo Por favor, instálalo desde https://nodejs.org/ antes de continuar.
    pause
    exit
)

:: 2. Instalar dependencias si no existen
if not exist "node_modules\" (
    echo [INFO] Instalando dependencias necesarias...
    call npm install express cors xlsx
)

:: 3. Iniciar el servidor de sincronización en una nueva ventana
echo [OK] Iniciando Servidor de Sincronización Local...
start "Mindsmith Sync Server" cmd /c "node sync_server.js"

:: 4. Esperar un par de segundos para que el servidor arranque
timeout /t 3 /nobreak >nul

:: 5. Abrir el CRM en el navegador
echo [OK] Abriendo CRM...
start index.html

echo =========================================================
echo ✅ TODO LISTO. 
echo Recuerda NO cerrar la ventana negra del servidor mientras trabajas.
echo =========================================================
pause
