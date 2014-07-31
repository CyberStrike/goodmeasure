class AddTitleToAttachments < ActiveRecord::Migration
  def change
  	add_column :related_materials, :title, :string
  end
end
