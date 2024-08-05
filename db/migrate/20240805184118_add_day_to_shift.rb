class AddDayToShift < ActiveRecord::Migration[7.1]
  def change
    add_column :shifts, :week_day, :integer
  end
end
