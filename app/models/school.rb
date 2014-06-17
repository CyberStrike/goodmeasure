class School < ActiveRecord::Base
	has_many :cohorts
	validates :name, presence: true
	validates :subdomain, uniqueness: { case_sensitive: false },
	            presence: true,
	            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }
end
