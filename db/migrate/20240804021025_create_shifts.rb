class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.integer :start, null: false
      t.integer :end, null: false
      t.integer :status, null: false, default: 0
      t.references :user, null: true, foreign_key: true
      t.references :week, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
