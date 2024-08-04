class CreateWeeks < ActiveRecord::Migration[7.1]
  def change
    create_table :weeks do |t|
      t.integer :number
      t.integer :year

      t.timestamps
    end
    add_index :weeks, :number, unique: true
    add_index :weeks, :year, unique: true
  end
end
