class Enrollment < ActiveRecord::Base
	belongs_to :user
	belongs_to :cohort
	belongs_to :school
	belongs_to :role

	# Find a way to destroy submissions/ make submissions dependent on enrollments

	validates_uniqueness_of :user, scope: [:cohort],
	                               message: "is already enrolled in this cohort."
	                               
	validates_presence_of :user, :cohort, :school, :role

end
