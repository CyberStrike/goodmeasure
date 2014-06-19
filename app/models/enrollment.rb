class Enrollment < ActiveRecord::Base
	belongs_to :user
	belongs_to :cohort
	belongs_to :school
	belongs_to :role
	validates_uniqueness_of :user, scope: [:cohort]
	# validates :role, numericality: {
	#                      only_integer: true,
	#                      greater_than: 0,
	#                      less_than_or_equal_to: 5
	#                    }
end
