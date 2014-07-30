class CreateUserBlockers < ActiveRecord::Migration
  def change
    create_table :user_blockers do |t|
      t.references :user, index: true
      t.references :blocker, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
