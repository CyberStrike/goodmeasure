class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :pasword
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :school, index: true

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
