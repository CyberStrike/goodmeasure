class Cohort < ActiveRecord::Base

	belongs_to :school
	has_many :enrollments
	has_many :tasks
	has_many :users
	has_many :users, through: :enrollments


	validates :school, presence: true
	validates :name, uniqueness: { case_sensitive: false },
                       presence: true,

	validates :description, presence: true                       
                       
end