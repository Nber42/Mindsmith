# Mindsmith CRM - Sistema de Gestión de Manuales Docentes

CRM completo para la gestión del procedimiento PR00-1: Elaboración y gestión de manuales con Mindsmith.

## 🚀 Despliegue Rápido (Netlify - Recomendado)

### Opción más fácil - 3 pasos:

1. **Ir a Netlify:** https://app.netlify.com/drop
2. **Arrastrar la carpeta** `Mindsmith` completa a la zona de "drop"
3. **¡Listo!** Netlify te dará una URL como `https://random-name-123.netlify.app`

### Personalizar la URL:
- Haz clic en "Site settings" → "Change site name"
- Elige: `mindsmith-crm-tu-universidad`
- Nueva URL: `https://mindsmith-crm-tu-universidad.netlify.app`

---

## 📋 Características

✅ **Dashboard interactivo** con métricas en tiempo real
✅ **Diagrama de Gantt** con 16 hitos (PRE + A-O)
✅ **Gestión de proyectos** con timeline visual
✅ **22 plantillas dinámicas** (Anexos A-F del PR00-1)
✅ **Control de versiones** de Mindsmith
✅ **Trazabilidad completa** con logs de actividad
✅ **Validación de dependencias** entre hitos

---

## 🎯 Uso del Sistema

### Navegación Principal

**Dashboard**
- Vista general de todos los proyectos
- Métricas dinámicas (proyectos activos, en curso, alertas, atrasados)
- Distribución por fases
- Alertas críticas

**Gantt Chart**
- Timeline maestro de todos los proyectos
- Visualización de los 16 hitos por proyecto
- Indicador de "HOY" para referencia temporal
- Click en cualquier proyecto para ver detalle

**Proyectos (Vista Detalle)**
- Timeline vertical de los 16 hitos
- Validación de hitos con captura de versión (Hito D)
- Control de versiones de Mindsmith
- Historial de actividad completo
- Documentación obligatoria

**Plantillas**
- Repositorio de 22 plantillas oficiales (Anexos A-F)
- **Selector de proyecto** en la parte superior
- Datos dinámicos: Asignatura, Código, DT, Autor
- Vista previa institucional
- Exportación (próximamente)

---

## 📝 Plantillas Dinámicas - Cómo Usar

1. Ve a la sección **"Plantillas"** desde el menú lateral
2. **Selecciona el proyecto** en el dropdown superior (ej: "MKT202 - Marketing Digital")
3. Elige la plantilla que necesitas del listado lateral (A1, B1, C1, etc.)
4. Los datos del proyecto se auto-rellenan automáticamente:
   - Asignatura
   - Código
   - Responsable DT
   - Autor

**Ejemplo:**
- Si seleccionas el proyecto "IA101 - IA Fundamentos"
- Y eliges la plantilla "D7: Correo Entrega Hito D"
- Verás: "Asignatura: IA Fundamentos", "Código: IA101", "DT: Dr./Dra. García", "Autor: Pérez"

---

## 🔄 Flujo de Trabajo (16 Hitos)

### FASE 1: Solicitud
- **PRE** - Solicitud y Aprobación (Plantillas: A1, A2, A3)

### FASE 2: Alta Técnica
- **A** - Encargo (Plantillas: B1, B2, B3, C1, C2)

### FASE 4: Desarrollo
- **B** - Seguimiento (D2)
- **E** - Muestra (D3, D4)
- **F** - Feedback (D1)
- **D** - Cierre Académico ⚠️ Captura versión Mindsmith (D6, D7, D8)

### FASE 5: Maquetación
- **G** - Entrega Proveedor (E1)
- **H** - Auditoría Accesibilidad (E2)
- **I** - Cierre Editable (E3)
- **J** - Maquetación
- **K** - SCORM Provisional (E4)
- **L** - Revisión Funcional (E4)
- **M** - SCORM Definitivo (E5)

### FASE 6: Publicación
- **N** - Carga LMS (F1)
- **O** - Manual Operativo (F2, F3)

---

## ⚙️ Funcionalidades Avanzadas

### Validación de Hitos
- **Dependencias:** No puedes validar un hito sin completar el anterior
- **Hito D especial:** Solicita la versión de Mindsmith aprobada
- **Registro automático:** Cada validación guarda fecha, usuario y acción

### Control de Versiones
- Campo `mindsmithVersion` capturado en Hito D
- Visible en la vista de detalle del proyecto
- Mostrado en plantilla D7 si está disponible

### Historial de Actividad
- Logs completos de todas las acciones
- Fecha, usuario y descripción
- Visible en la barra lateral de cada proyecto

---

## 🌐 Compartir con Compañeros

Una vez desplegado en Netlify/Vercel/GitHub Pages, comparte:

```
🔗 URL del CRM: [TU-URL-AQUI]

📌 Instrucciones:
1. Abre la URL en Chrome, Firefox o Edge
2. Navega usando el menú lateral
3. Los datos son de ejemplo (se reinician al recargar)

👤 Rol: SAE (Servicio de Asesoramiento Docente)
```

---

## 💾 Datos de Ejemplo

El sistema incluye 5 proyectos de ejemplo:

1. **IA101** - IA Fundamentos (Fase 2, 2 hitos completados)
2. **MKT202** - Marketing Digital (Fase 4, 5 hitos completados)
3. **DER305** - Derecho Mercantil (Fase 4, retrasado 5 días)
4. **PSI404** - Psicología Clínica (Fase 5, 12 hitos completados, versión aprobada)
5. **ENG105** - Inglés Avanzado (Fase 1, proyecto nuevo)

---

## 🔒 Notas Importantes

- **Datos locales:** Los datos se almacenan en la sesión del navegador
- **Sin backend:** No hay base de datos compartida (por ahora)
- **Uso recomendado:** Demostración, formación y prototipado
- **Producción:** Considerar migrar a CRM con BD (Salesforce, HubSpot, Zoho)

---

## 📞 Soporte

Para dudas o mejoras, contacta con el equipo de desarrollo.

**Versión:** 3.0 Premium  
**Última actualización:** 26 de enero de 2026
