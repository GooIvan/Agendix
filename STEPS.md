# 🚀 Pasos rápidos para crear Backend API en Rails 8 con Scaffold

## 1️⃣ Crear el proyecto en modo API
```bash
rails new tasknotes --api
cd tasknotes
```

## 2️⃣ Generar scaffolds

**Category:**
```bash
rails g scaffold Category name:string description:string emoji:string
```

**Task:**
```bash
rails g scaffold Task title:string description:text status:integer category:references
```

## 3️⃣ Agregar relación y enum

**`app/models/task.rb`**
```ruby
class Task < ApplicationRecord
  belongs_to :category
  enum :status, { pendiente: 0, completada: 1, cancelada: 2 }
end
```

**`app/models/category.rb`**
```ruby
class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
```

## 4️⃣ Crear y migrar la base de datos
```bash
rails db:create db:migrate
```

## 5️⃣ (Opcional) Agregar datos iniciales en `db/seeds.rb`
```ruby
work = Category.create(name: "Trabajo", emoji: "💼", description: "Tareas laborales")
study = Category.create(name: "Estudio", emoji: "📚", description: "Notas de clases")

Task.create(title: "Enviar informe", description: "Informe mensual", status: :pendiente, category: work)
Task.create(title: "Leer capítulo 5", description: "Libro de programación", status: :completada, category: study)
```

```bash
rails db:seed
```

## 6️⃣ Probar API
Levantar servidor:
```bash
rails s
```

## ⚠️ Nota: Si da conflictos al momento de utilizar git con el proyecto, utilizar:
```bash
Remove-Item -Recurse -Force tasknotes\.git
```

# 🚀 Pasos rápidos para crear FrondEnd con flutter
flutter pub add

instalar http
instalar bloc
instalar equatable
get_it
