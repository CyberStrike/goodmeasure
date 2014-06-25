class Submission < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	validates :submission, presence: true
	validates :correctness, inclusion: [true, false]
	validates :reviewed, inclusion: [true, false]
	validates_uniqueness_of :user, scope: [:task], message: "has already submitted."

	def is_correct?
		self.correctness == true
	end

end
