class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.integer :temperature_in_degrrees
      t.float :brew_time_in_minutes

      t.timestamps
    end
  end
end
