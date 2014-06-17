class AddSubdomainToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :subdomain, :string
    add_index :schools, :subdomain, unique: true
  end
end
