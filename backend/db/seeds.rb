work = Category.create(name: "Trabajo", description: "Tareas de trabajo", emoji: "👜")
school = Category.create(name: "Escuela", description: "Tareas de escuela", emoji: "🏫")

Task.create(title: "Diapositiva", description: "Realizar diapositiva para la exposición sobre los seres vivos", status: 0, category: school)
Task.create(title: "Prueba de alcohol", description: "Realizarme la prueba de alcohol lo mas antes posible", status: 0, category: work)
