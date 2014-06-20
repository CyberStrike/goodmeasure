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


	def instructor
		self.enrollments.where(role_id:3)
	end


	def ta
		self.enrollments.where(role_id:2)
	end


end
