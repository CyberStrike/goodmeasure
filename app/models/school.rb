class School < ActiveRecord::Base
	has_many :cohorts
	has_many :users
	has_many :invites
	has_many :enrollments
	validates :name, presence: true
	validates :subdomain, uniqueness: { case_sensitive: false },
	            presence: true,
	            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }



	def staff
		instructor + ta
	end

	def students
		self.enrollments.where(role_id: (Role.find_by title: "Student"))
	end


	def instructor
		self.enrollments.where(role_id: (Role.find_by title: "Instructor"))
	end


	def ta
		self.enrollments.where(role_id: (Role.find_by title: "TA"))
	end


end
