class AddColorToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :color, :string, null: false
  end
end
