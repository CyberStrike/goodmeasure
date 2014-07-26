class AddHtmlToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :html, :text
  end
end
