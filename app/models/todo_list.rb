class TodoList < ApplicationRecord
  attr_accessor :user_id
  has_and_belongs_to_many :users

  has_many :todos
end
