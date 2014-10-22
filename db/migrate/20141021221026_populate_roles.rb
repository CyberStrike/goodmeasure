class PopulateRoles < ActiveRecord::Migration
  def change
    %w[Student TA Instructor].each do |name|
      Role.create(title: name)
    end
  end
end
