# Guía: CRM Python en OneDrive - Gestión de Datos y Concurrencia

Esta guía resuelve los tres retos planteados para tu CRM en Python dentro de una carpeta compartida de OneDrive.

## 1. Rutas Relativas con `pathlib`
Para que el CRM funcione en cualquier ordenador (sin importar el nombre de usuario), debemos evitar rutas fijas como `C:\Users\Juan\...`. Usaremos `pathlib` para detectar la ubicación del script actual.

```python
from pathlib import Path
import sqlite3

# Obtiene la carpeta donde está guardado este script de Python
BASE_DIR = Path(__file__).resolve().parent

# Define la ruta a la base de datos dentro de esa misma carpeta
DB_PATH = BASE_DIR / "crm_datos.db"

def conectar_db():
    print(f"Conectando a: {DB_PATH}")
    return sqlite3.connect(DB_PATH)
```

## 2. El Riesgo de Concurrencia (File Locking) en OneDrive
OneDrive **no es un servidor de base de datos**. Es un sistema de sincronización de archivos. 

### El Problema
- SQLite usa "locks" a nivel de sistema de archivos local.
- Si el **Usuario A** abre la DB, su sistema la bloquea localmente.
- El **Usuario B** hace lo mismo en su ordenador.
- Cuando ambos guardan, OneDrive ve dos versiones distintas del mismo archivo `.db`.
- **Resultado**: OneDrive crea un archivo de copia con sufijo (ej: `crm_datos-PC-JUAN.db`). Los datos se bifurcan y se pierden.

### Soluciones
1.  **Bloqueo Manual (Semáforo)**: Crea un archivo vacío llamado `LOCK.txt` al abrir el CRM y bórralo al cerrar. Si el archivo existe, avisa al usuario que "Alguien más está editando".
2.  **Modo de Solo Lectura**: Por defecto, abre la DB en solo lectura y solo pide permisos de escritura cuando el usuario pulse un botón de "Guardar".
3.  **Lógica CSV**: Los CSV son más fáciles de "fusionar" manualmente en caso de conflicto, pero pierden la integridad relacional.

## 3. Verificar Permisos de Escritura
Antes de intentar una operación pesada, verifica si tienes acceso:

```python
import os

def check_write_permission(file_path):
    if not os.path.exists(file_path):
        # Si el archivo no existe, chequeamos si podemos crear en la carpeta
        return os.access(os.path.dirname(file_path), os.W_OK)
    
    # Verifica si el archivo es escribible
    return os.access(file_path, os.W_OK)

if check_write_permission(DB_PATH):
    print("✅ Tienes permisos de escritura.")
else:
    print("❌ El archivo está bloqueado o no tienes permisos.")
```
