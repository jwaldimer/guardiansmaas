class AddDateToShift < ActiveRecord::Migration[7.1]
  def change
    add_column :shifts, :date, :string
  end
end
