work = Category.create!(name: "Trabajo", emoji: "💼", description: "Tareas laborales")
study = Category.create!(name: "Estudio", emoji: "📚", description: "Notas de clases")

Task.create!(title: "Enviar informe", description: "Informe mensual", status: :pendiente, category: work)
Task.create!(title: "Leer capítulo 5", description: "Libro de programación", status: :completada, category: study)
