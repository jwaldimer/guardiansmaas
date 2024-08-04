class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.integer :weekdays_start
      t.integer :weekdays_end
      t.integer :weekend_start
      t.integer :weekend_end
      t.datetime :start_at
      t.datetime :end_at
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
