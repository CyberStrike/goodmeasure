class School < ActiveRecord::Base
	has_many :cohorts, dependent: :destroy
	has_many :units,   through: :cohorts
	has_many :users,   dependent: :destroy
	has_many :invites, dependent: :destroy
	has_many :enrollments

	validates :name,      presence: true

	validates :subdomain, uniqueness: { case_sensitive: false },
                          presence:   true,
                          format:     { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }



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

	# Checks for created students
	def has_users?
		self.users.size > 0
	end

	# Checks for created cohorts
	def has_cohorts?
		self.cohorts.size > 0
	end

	# Checks to see if there are any available users who are not enrolled in a cohort
	def has_users_not_in?(cohort)
		self.users.size - cohort.users.size > 0
	end

	# Checks to see if there are any available cohorts for a user to enroll in.
	def has_cohorts_not_in?(user)
		self.cohorts.size - user.cohorts.size > 0
	end

	# Returns all cohorts a user is not enrolled in.  Accepts an empty user.
	def available_cohorts(user)
		user.nil? ? self.cohorts : self.cohorts - user.cohorts
	end

	# Returns all users not enrolled in a particular cohort.  Accepts an empty cohort.
	def available_users(cohort)
		cohort.nil? ? self.users : self.users - cohort.users
	end


end
