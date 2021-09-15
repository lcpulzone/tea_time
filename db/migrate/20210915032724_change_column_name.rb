class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :teas, :temperature_in_degrrees, :temperature_in_degrees
  end
end
