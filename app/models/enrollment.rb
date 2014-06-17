class Enrollment < ActiveRecord::Base
	belongs_to :user
	belongs_to :cohort
	validates :access, numericality: {
	                     only_integer: true,
	                     greater_than: 0,
	                     less_than_or_equal_to: 5
	                   }
end
