class AddSchoolToEnrollment < ActiveRecord::Migration
  def change
    add_reference :enrollments, :school, index: true
  end
end
