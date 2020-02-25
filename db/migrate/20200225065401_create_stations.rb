class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :line_name, null: false
      t.string :station_name, null: false
      t.integer :walk_minutes, null: false
      
      t.timestamps
    end
  end
end
