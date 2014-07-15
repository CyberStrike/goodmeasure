class CreateRelatedMaterials < ActiveRecord::Migration
  def change
    create_table :related_materials do |t|
      t.references :attachable, polymorphic: true

      t.timestamps
    end
  end
end
