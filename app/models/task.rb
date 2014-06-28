class Task < ActiveRecord::Base
	belongs_to :unit
	has_many :submissions, dependent: :destroy
	
	validates :title, presence: true

	def has_next?
		!unit.tasks.where("id > ?", self.id).order("id ASC").first.blank?
	end

	def has_previous?
		!unit.tasks.where("id < ?", self.id).order("id DESC").first.blank?
	end

	def next
		unit.tasks.where("id > ?", self.id).order("id ASC").first
	end
	
	def previous
		unit.tasks.where("id < ?", self.id).order("id DESC").first
	end
	
	end

## if we wanted to time up to the milisecond it would go in the task model