# 📕 Guía de Sincronización Local con Excel

Para que el CRM guarde automáticamente los cambios en tus archivos Excel locales, sigue estos pasos:

### 1. Iniciar el CRM (Dos opciones)

#### OPCIÓN A: Conexión Directa (Recomendada para el Equipo - Sin instalar nada)
Si no quieres instalar Node.js, ahora puedes conectar el CRM directamente a tu carpeta:
1.  Abre el archivo **`index.html`** en Chrome o Edge.
2.  En la parte superior, verás un botón naranja que dice: **"📂 CONECTAR CARPETA SINO NODE"**.
3.  Púlsalo y selecciona la carpeta del proyecto (`Mindsmith`) en tu OneDrive.
4.  ¡Listo! El CRM leerá y guardará los Excel directamente sin necesidad de servidores.

#### OPCIÓN B: Lanzador Automático (Requiere Node.js)
Si ya tienes Node.js instalado, puedes usar el archivo:
👉 **`INICIAR_MINDSMITH.bat`**
Este archivo arranca un servidor local que gestiona la comunicación automáticamente.

---

### Cómo colaborar con el equipo
1.  **Comparte la carpeta**: Asegúrate de que tus compañeros tengan la carpeta `Mindsmith` sincronizada en su ordenador a través de OneDrive.
2.  **Cada uno usa su CRM**: Cada persona abre su `index.html`.
3.  **Conexión**: Cada uno usa la **Opción A** (botón naranja) para conectar su carpeta local.
4.  **Sincronización**: OneDrive se encargará de que los cambios que tú hagas en los Excel le lleguen a los demás automáticamente.

### 6. Colaboración en Equipo (Multiusuario)
Si quieres que otras personas de tu equipo vean y editen la información, sigue estos pasos:

1.  **Compartir Carpeta**: Comparte esta carpeta de OneDrive con tus compañeros para que la tengan sincronizada en su ordenador.
2.  **Sincronización Local**: Cada compañero debe asegurarse de que la carpeta aparece en su explorador de archivos (ej. en `C:\Users\Nombre\OneDrive...`).
3.  **Ejecutar Servidor Individual**: Cada persona que quiera ver/editar datos debe tener instalado Node.js y ejecutar `node sync_server.js` en su propio ordenador.
4.  **Uso Simultáneo**: 
    - El CRM de cada persona leerá y escribirá en sus archivos locales.
    - **OneDrive** se encargará de subir los archivos `.xlsx` a la nube y bajarlos a los ordenadores de los demás automáticamente.
    - *Nota*: Si dos personas editan exactamente el mismo campo al mismo segundo, OneDrive podría crear un archivo de "conflicto", pero para uso normal de equipo funciona perfectamente como base de datos compartida.

---

> [!IMPORTANT]
> **Fuente de Verdad**: Al estar en OneDrive, tus archivos Excel son ahora la "Base de Datos" oficial. Puedes editarlos manualmente (con cuidado) y el CRM cargará esos cambios al refrescar.
> Si el servidor no está encendido, el CRM seguirá funcionando normalmente usando el almacenamiento local del navegador (`localStorage`), pero no actualizará los Excels.
