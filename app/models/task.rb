class Task < ActiveRecord::Base
	belongs_to :unit

	validates :description,
		presence: true
end

