class User < ActiveRecord::Base
	has_secure_password
	has_many :cohorts, through: :enrollments
	has_many :comments
	has_many :enrollments
	has_many :submissions
	belongs_to :school

validates_associated :cohorts, :comments, :enrollments, :submissions

validates :username, uniqueness: {case_sensitive: false},
			presence: true
validates :first_name, presence: true, 
			uniqueness: { case_sensitive: false }, 
			length: { minimum: 2 }
validates :last_name, presence: true, 
			uniqueness: { case_sensitive: false }, 
			length: { minimum: 2 }
validates :email, presence: true, 
			uniqueness: { case_sensitive: false },
			format: { with: /\A[^@]+@[^@]+\z/ }
end
