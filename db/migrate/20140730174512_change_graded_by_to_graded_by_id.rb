class ChangeGradedByToGradedById < ActiveRecord::Migration
  def change
    remove_column :submissions, :graded_by

    add_column :submissions, :graded_by_id, :integer
    add_index :submissions, :graded_by_id
  end
end
