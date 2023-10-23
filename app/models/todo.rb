class Todo < ApplicationRecord
  validates :title, presence: true
  validates_date :due_date, on_or_after: lambda { Date.current }, if: :due_date
end
