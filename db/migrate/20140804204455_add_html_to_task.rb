class AddHtmlToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :html, :text
  end
end
