# 🚀 **TaskNotes - MVP**

## 🛠️ **Funcionalidades clave**

### 📂 **1. Categorías**
- **CRUD** completo.  
- **Atributos**:  
  - **`name`** *(string)* → Nombre de la categoría.  
  - **`description`** *(string, opcional)* → Descripción breve.  
  - **`emoji`** *(string, opcional)* → Ícono identificador (💼, 📚, 🏠, etc.).  

---

### 📝 **2. Tareas**
- **CRUD** completo.  
- **Atributos**:  
  - **`title`** *(string)* → Título de la tarea.  
  - **`description`** *(text, opcional)* → Detalles de la tarea.  
  - **`status`** *(enum)* → Estados:  
    - ⏳ **pendiente**  
    - ✅ **completada**  
    - ❌ **cancelada**  
  - **`category_id`** → Relación con una categoría.  

---

### 🎯 **3. Extras**
- 🔍 **Filtrar tareas por estado** (pendientes / canceladas / completadas).  
- 🖊 **Buscar por título**.  
- 🎨 **Colores o iconos** distintos según el estado.  
- 📊 **Contador** de tareas completadas vs. pendientes.  

---

## ⚙️ **Cómo funcionará**

### 💻 **1. Backend (Rails API)**
**Estructura de datos**:  
- `Category` ↔ `Task` (**1:N**)

**Endpoints principales**:
```bash
GET /categories
POST /categories
GET /categories/:id
PUT/PATCH /categories/:id
DELETE /categories/:id

GET /tasks
POST /tasks
GET /tasks/:id
PUT/PATCH /tasks/:id
DELETE /tasks/:id
```

**Extras**:
- Filtrar por estado:  
  ```bash
  GET /tasks?status=pendiente
  GET /tasks?status=completada
  GET /tasks?status=cancelada
  ```
- Buscar por título:  
  ```bash
  GET /tasks?search=palabra
  ```

---

### 📱 **2. Frontend (Flutter)**
**Pantallas**:
1. **Lista de categorías** 📂  
   - Muestra todas las categorías con su emoji.  
   - Botón ➕ para añadir categoría.  

2. **Lista de tareas por categoría** 📝  
   - Lista de tareas filtradas por categoría.  
   - Filtro por estado y barra de búsqueda.  

3. **Nueva tarea** ✏  
   - Formulario con campos básicos.  

4. **Detalle de tarea** 🔍  
   - Cambiar estado (pendiente / completada / cancelada).  
   - Botón ✏ para editar tarea.  

5. **Editar tarea** 🖊  
   - Formulario para actualizar título, descripción y estado.  

---

## 💾 **Ejemplo de datos**

**Categorías**:
```json
[
  { "id": 1, "name": "Trabajo", "emoji": "💼", "description": "Tareas laborales" },
  { "id": 2, "name": "Estudio", "emoji": "📚", "description": "Notas de clases" }
]
```

**Tareas**:
```json
[
  { "id": 1, "title": "Enviar informe", "description": "Informe mensual", "status": "pendiente", "category_id": 1 },
  { "id": 2, "title": "Leer capítulo 5", "description": "Libro de programación", "status": "completada", "category_id": 2 }
]
```
