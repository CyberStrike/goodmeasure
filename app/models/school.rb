class School < ActiveRecord::Base
	has_many :cohorts
	validates :subdomain, presence: true
end
