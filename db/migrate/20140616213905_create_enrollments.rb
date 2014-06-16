class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :cohort, index: true
      t.integer :role

      t.timestamps
    end
  end
end
