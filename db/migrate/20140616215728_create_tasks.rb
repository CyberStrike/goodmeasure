class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :visibility
      t.references :unit, index: true

      t.timestamps
    end
  end
end
