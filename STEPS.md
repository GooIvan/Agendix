# 🛠️ STEPS - Backend Rails 8 para TaskNotes

## 1️⃣ Crear proyecto Rails en modo API
```bash
rails new tasknotes --api
cd tasknotes
```

---

## 2️⃣ Configurar base de datos
Por defecto será SQLite, suficiente para la demo.

```bash
rails db:create
```

---

## 3️⃣ Generar modelos
### Categoría
```bash
rails g model Category name:string description:string emoji:string
```

### Tarea
```bash
rails g model Task title:string description:text status:integer category:references
```

---

## 4️⃣ Migrar base de datos
```bash
rails db:migrate
```

---

## 5️⃣ Definir relaciones y enums (Rails 8 sintaxis)
**app/models/category.rb**
```ruby
class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
```

**app/models/task.rb**
```ruby
class Task < ApplicationRecord
  belongs_to :category

  enum :status, { pendiente: 0, completada: 1, cancelada: 2 }
end
```

---

## 6️⃣ Generar controladores
```bash
rails g controller Categories
rails g controller Tasks
```

---

## 7️⃣ Configurar rutas
**config/routes.rb**
```ruby
Rails.application.routes.draw do
  resources :categories
  resources :tasks
end
```

---

## 8️⃣ Endpoints básicos
**app/controllers/categories_controller.rb**
```ruby
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def index
    render json: Category.all
  end

  def show
    render json: @category
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :emoji)
  end
end
```

**app/controllers/tasks_controller.rb**
```ruby
class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  def index
    tasks = Task.all
    tasks = tasks.where(status: params[:status]) if params[:status].present?
    tasks = tasks.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
    render json: tasks
  end

  def show
    render json: @task
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :category_id)
  end
end
```

---

## 9️⃣ Datos de prueba (Seeds)
**db/seeds.rb**
```ruby
work = Category.create!(name: "Trabajo", emoji: "💼", description: "Tareas laborales")
study = Category.create!(name: "Estudio", emoji: "📚", description: "Notas de clases")

Task.create!(title: "Enviar informe", description: "Informe mensual", status: :pendiente, category: work)
Task.create!(title: "Leer capítulo 5", description: "Libro de programación", status: :completada, category: study)
```

---

## 🔟 Ejecutar semillas
Si quieres reiniciar todo:
```bash
rails db:drop db:create db:migrate db:seed
```

Si solo quieres recargar datos:
```bash
rails db:seed
```

---

## 1️⃣1️⃣ Probar API
Arrancar servidor:
```bash
rails s
```

Probar en navegador o Postman:
```
GET http://localhost:3000/categories
GET http://localhost:3000/tasks
```
