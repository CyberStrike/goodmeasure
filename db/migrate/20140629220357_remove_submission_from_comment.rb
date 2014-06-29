class RemoveSubmissionFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :submission_id, :integer
    add_column :comments, :commentable_id, :integer
  end
end
