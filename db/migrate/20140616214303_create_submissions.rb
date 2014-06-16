class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.text :submission
      t.boolean :correctness
      t.integer :percieved_points
      t.integer :actual_points

      t.timestamps
    end
  end
end
