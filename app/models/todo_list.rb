class TodoList < ApplicationRecord
  has_and_belongs_to_many :users

  has_many :todos
end
