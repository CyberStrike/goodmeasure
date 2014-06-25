class AddReviewToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :reviewed, :boolean
  end
end
