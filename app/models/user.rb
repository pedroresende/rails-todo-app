class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,  :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :todo_lists

  has_many :todos, through: :todo_lists

  # Hook responsible for creating a todo_list after a given user being created
  after_commit :create_default_list_group, on: :create

  private

  def create_default_list_group
    self.todo_lists.create(title: 'Default')
  end
end
