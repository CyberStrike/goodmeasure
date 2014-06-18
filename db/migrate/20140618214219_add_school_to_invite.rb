class AddSchoolToInvite < ActiveRecord::Migration
  def change
    add_reference :invites, :school, index: true
  end
end
