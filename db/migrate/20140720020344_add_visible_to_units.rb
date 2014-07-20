class AddVisibleToUnits < ActiveRecord::Migration
  def change
    add_column :units, :visible, :boolean
  end
end
