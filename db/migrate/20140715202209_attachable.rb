class Attachable < ActiveRecord::Migration
  def change
  	add_index :related_materials, [:attachable_id, :attachable_type]
  end
end
