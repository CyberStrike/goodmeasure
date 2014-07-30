class AddGradedByToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :graded_by, :integer
    add_index :submissions, :graded_by
  end
end
