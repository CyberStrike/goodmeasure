class Cohort < ActiveRecord::Base

	belongs_to :school
	has_many :enrollments
	has_many :tasks
	has_many :users
	has_many :units
	has_many :users, through: :enrollments


	validates :school, presence: true
	validates :name, uniqueness: { case_sensitive: false },
                       presence: true

	validates :description, presence: true                       
   
	def students
		self.enrollments.where(role_id:1)
	end

	def staff
		instructor + ta
	end

	def instructor
		self.enrollments.where(role_id:3)
	end

	def ta
		self.enrollments.where(role_id:2)
	end

	def has_users?
		self.users.size > 0
	end

end