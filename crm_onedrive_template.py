import os
import sqlite3
from pathlib import Path

# --- CONFIGURACIÓN DE RUTAS ---
# BASE_DIR es la carpeta donde está este script
BASE_DIR = Path(__file__).resolve().parent
DB_FILE = BASE_DIR / "crm_mindsmith.db"
LOCK_FILE = BASE_DIR / "db.lock"

def check_access():
    """Verifica si el archivo es escribible."""
    if not DB_FILE.exists():
        # Si no existe, verificamos la carpeta
        return os.access(BASE_DIR, os.W_OK)
    return os.access(DB_FILE, os.W_OK)

def manage_lock(action="acquire"):
    """Gestión simple de bloqueo para OneDrive."""
    if action == "acquire":
        if LOCK_FILE.exists():
            return False # Ya está bloqueado por otro
        LOCK_FILE.touch()
        return True
    elif action == "release":
        if LOCK_FILE.exists():
            LOCK_FILE.unlink()

def init_crm():
    if not check_access():
        print("CRÍTICO: No tienes permisos de escritura en esta carpeta de OneDrive.")
        return

    if not manage_lock("acquire"):
        print("ALERTA: Otro usuario tiene abierto el CRM. Espera a que termine para evitar conflictos.")
        # Opcional: permitir abrir en modo lectura
        return

    try:
        conn = sqlite3.connect(DB_FILE)
        cursor = conn.cursor()
        # Tu lógica de CRM aquí
        print("Conectado a la base de datos en OneDrive satisfactoriamente.")
        
        # Simular trabajo
        # cursor.execute("CREATE TABLE IF NOT EXISTS...")
        
    finally:
        manage_lock("release")
        print("Cierre seguro: Bloqueo liberado.")

if __name__ == "__main__":
    init_crm()
