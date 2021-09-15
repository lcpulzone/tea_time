class ChangeColumnNameAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :teas, :temperature_in_degrees, :temperature_in_fahrenheit
  end
end
