work = Category.create(name: "Trabajo", description: "Estas son las tareas relacionadas con el trabajo", emoji: "👜")
school = Category.create(name: "Escuela", description: "Estas son las tareas relacionadas con el colegio", emoji: "🏫")

Task.create(title: "Entrevista de trabajo", description: "Tengo que ir a la entrevista de trabajo lo mas pronto posible", status: 0, category: work)
Task.create(title: "Realizar power point", description: "Tengo que realizar una diapositiva para exponer en el colegio", status: 0, category: school)