class Task < ApplicationRecord
  belongs_to :category

  enum :status, {
    pending: 0,
    completed: 1,
    cancelled: 2
  }
end
