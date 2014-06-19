class RemoveRoleFromEnrollments < ActiveRecord::Migration
  def change
    remove_column :enrollments, :role, :string
  end
end
