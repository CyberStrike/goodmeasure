class Cohort < ActiveRecord::Base

	belongs_to :school
	has_many :enrollments,  dependent: :destroy
	has_many :submissions,  through: :tasks
	has_many :tasks,        through: :units
	has_many :units,        dependent: :destroy
	has_many :users,        through: :enrollments
	has_many :blockers,     dependent: :destroy

	validates :school,      presence: true

	validates :description, presence: true 

	validates :name,        uniqueness: { case_sensitive: false },
                            presence: true   
   
	def students
		self.enrollments.where(role_id: 1).map{ |enrollment| enrollment.user }
	end

	def instructors
		self.enrollments.where(role_id: 3).map{ |enrollment| enrollment.user }
	end

	def staff
		self.enrollments.where(role_id: 2 || 3).map{ |enrollment| enrollment.user }
	end

	def tas
		self.enrollments.where(role_id: 2).map{ |enrollment| enrollment.user }
	end

	def has_users?
		self.users.size > 0
	end

end