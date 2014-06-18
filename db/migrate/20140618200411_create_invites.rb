class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.references :school_id, index: true
      t.string :token

      t.timestamps
    end
  end
end
