class Task < ApplicationRecord
  belongs_to :category

  enum :status, { pendiente: 0, completada: 1, cancelada: 2 }
end
