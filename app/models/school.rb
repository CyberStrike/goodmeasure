class School < ActiveRecord::Base
	has_many :cohorts
	has_many :units, through: :cohorts
	has_many :users
	has_many :invites
	has_many :enrollments
	validates :name, presence: true
	validates :subdomain, uniqueness: { case_sensitive: false },
	            presence: true,
	            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }



	def staff
		instructors + tas
	end

	def students
		self.enrollments.where(role_id: (Role.find_by title: "Student"))
	end

	def instructors
		self.enrollments.where(role_id: (Role.find_by title: "Instructor"))
	end

	def tas
		self.enrollments.where(role_id: (Role.find_by title: "TA"))
	end

	def has_users?
		self.users.size > 0
	end

	def has_cohorts?
		self.cohorts.size > 0
	end

	def has_users_not_in?(cohort)
		self.users.size - cohort.users.size > 0
	end


end
