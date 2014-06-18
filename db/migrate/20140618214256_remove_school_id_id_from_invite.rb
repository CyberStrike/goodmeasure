class RemoveSchoolIdIdFromInvite < ActiveRecord::Migration
  def change
    remove_column :invites, :school_id_id, :string
  end
end
