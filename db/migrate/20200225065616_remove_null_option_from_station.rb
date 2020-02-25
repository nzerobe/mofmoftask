class RemoveNullOptionFromStation < ActiveRecord::Migration[5.2]
  def change
    
    def up
    change_column :stations, :line_name, :string, null: true
    change_column :stations, :station_name, :string, null: true
    change_column :stations, :walk_minutes, :integer, null: true
  end

  def down
    change_column :stations, :line_name, :string, null: false
    change_column :stations, :station_name, :string, null: false
    change_column :stations, :walk_minutes, :integer, null: false
  end
  end
end
