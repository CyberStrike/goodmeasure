class CreateBlockers < ActiveRecord::Migration
  def change
    create_table :blockers do |t|
      t.string :blocker
      t.references :cohort, index: true

      t.timestamps
    end
  end
end
