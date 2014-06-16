class CreateTaks < ActiveRecord::Migration
  def change
    create_table :taks do |t|
      t.text :description
      t.booleanunit :visibility

      t.timestamps
    end
  end
end
