class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :sender, index: true
      t.references :receiver, index: true
      t.references :notifiable, polymorphic: true
      t.boolean :unread

      t.timestamps
    end

    add_index :notifications, [:notifiable_id, :notifiable_type]
  end
end
