class AddAttachmentFileToRelatedMaterials < ActiveRecord::Migration
  def self.up
    change_table :related_materials do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :related_materials, :file
  end
end
