class Submission < ActiveRecord::Base
	belongs_to :user
	belongs_to :task
	has_many :comments

	validates :submission,  presence: true
	validates :correctness, inclusion: [true, false]
	validates :reviewed,    inclusion: [true, false]

	validates_uniqueness_of :user, scope: [:task], message: "has already submitted."

	def is_correct?
		self.correctness == true
	end

	def has_been_reviewed?
		self.reviewed == true
	end

	def answer 
		self.submission
	end

end
