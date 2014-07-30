class Task < ActiveRecord::Base
	before_save :assign_position
	belongs_to :unit
	has_many :submissions, dependent: :destroy
	
	validates :title, presence: true
	validates :position, :uniqueness => {:scope => :unit}


	# Checks to see if task has a position, if not, add one
	def assign_position
   		if self.unit.tasks.nil?
     		self.position = 1    
   		else
	   		self.position = self.unit.tasks.size + 1
	   	end
 	end

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