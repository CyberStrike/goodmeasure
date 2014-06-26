class Task < ActiveRecord::Base
	belongs_to :unit
	has_many :submissions, dependent: :destroy

	validates :description,
		presence: true
end

## if we wanted to time up to the milisecond it would go in the task model