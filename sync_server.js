const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');

const app = express();
const PORT = 3001;

app.use(cors());
app.use(express.json({ limit: '50mb' }));

// Helper para guardar datos en Excel
const saveToExcel = (data, filename) => {
    try {
        const filePath = path.join(__dirname, filename);
        const worksheet = XLSX.utils.json_to_sheet(data);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Datos');
        XLSX.writeFile(workbook, filePath);
        console.log(`[OK] Archivo guardado: ${filename}`);
        return true;
    } catch (error) {
        console.error(`[ERROR] No se pudo guardar ${filename}:`, error);
        return false;
    }
};

// Helper para leer datos de Excel
const loadFromExcel = (filename) => {
    try {
        const filePath = path.join(__dirname, filename);
        if (!fs.existsSync(filePath)) return null;
        const workbook = XLSX.readFile(filePath);
        const sheetName = workbook.SheetNames[0];
        const data = XLSX.utils.sheet_to_json(workbook.Sheets[sheetName]);
        return data;
    } catch (error) {
        console.error(`[ERROR] No se pudo leer ${filename}:`, error);
        return null;
    }
};

app.post('/api/save', (req, res) => {
    const { filename, data } = req.body;
    if (!filename || !data) {
        return res.status(400).json({ error: 'Faltan datos o nombre de archivo' });
    }
    const success = saveToExcel(data, filename);
    if (success) {
        res.json({ message: 'Sincronización exitosa' });
    } else {
        res.status(500).json({ error: 'Error al escribir el archivo' });
    }
});

app.get('/api/load-all', (req, res) => {
    const data = {
        autores: loadFromExcel('Autores_Mindsmith.xlsx'),
        dts: loadFromExcel('DTs_Mindsmith.xlsx'),
        proyectos: loadFromExcel('Asignaturas_Mindsmith.xlsx'),
        links_authors: loadFromExcel('Vinculos_Autores.xlsx'),
        links_dts: loadFromExcel('Vinculos_DTs.xlsx'),
    };
    res.json(data);
});

app.get('/api/status', (req, res) => {
    res.json({ status: 'ready', directory: __dirname });
});

app.listen(PORT, () => {
    console.log(`
    ---------------------------------------------------------
    🚀 Mindsmith CRM Sync Server iniciado
    📡 Dirección: http://localhost:${PORT}
    📂 Carpeta de trabajo: ${__dirname}
    
    El CRM ahora guardará automáticamente los cambios en:
    - Autores_Mindsmith.xlsx
    - DTs_Mindsmith.xlsx
    - Asignaturas_Mindsmith.xlsx
    ---------------------------------------------------------
    `);
});
