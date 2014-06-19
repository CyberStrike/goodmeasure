class School < ActiveRecord::Base
	has_many :cohorts
	has_many :users
	has_many :invites
	has_many :enrollments
	validates :name, presence: true
	validates :subdomain, uniqueness: { case_sensitive: false },
	            presence: true,
	            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }
end
