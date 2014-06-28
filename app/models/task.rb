class Task < ActiveRecord::Base
	belongs_to :unit
	has_many :submissions, dependent: :destroy
	
	validates :title, presence: true


	# def self.multiple_tasks
	# 	if self.all > 1
	# 	end
	# end
	
	# def next
	# 	if Task.all > 1
	# 		self.next = 
	# 	foo = Task.find(params[:id])
	# end

	# def previous
	# end

	def next
		unit.tasks.where("id > ?", http://self.id).order("id ASC").first
	end
	
	def previous
		unit.tasks.where("id < ?", http://self.id).order("id DESC").first
	end
	
	end

## if we wanted to time up to the milisecond it would go in the task model