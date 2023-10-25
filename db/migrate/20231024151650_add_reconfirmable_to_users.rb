class AddReconfirmableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :reconfirmable, :string
  end
end
