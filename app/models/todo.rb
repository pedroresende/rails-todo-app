class Todo < ApplicationRecord
  belongs_to :todo_list
  has_rich_text :content

  validates :title, presence: true
  validates_date :due_date, on_or_after: lambda { Date.current }, if: :due_date
end
