class RemoveUniquefromWeek < ActiveRecord::Migration[7.1]
  def change
    remove_index :weeks, :year
    add_index :weeks, :year
  end
end
