class Updates < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :pasword
    remove_column :users, :password
  end
end
