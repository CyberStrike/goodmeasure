class Submission < ActiveRecord::Base
	default_scope { order(id: :desc) }

	belongs_to :user
	belongs_to :task
	has_many :comments, as: :commentable, dependent: :destroy

	validates :submission,  presence: true
	validates :correctness, inclusion: [true, false]
	validates :reviewed,    inclusion: [true, false]

	# validates_uniqueness_of :user, scope: [:task], message: "has already submitted."

	def is_correct?
		self.correctness == true
	end

	def is_incorrect?
		self.reviewed == true &&
		self.correctness == false
	end

	def has_been_reviewed?
		self.reviewed == true
	end

	def is_pending_review?
		self.reviewed == false
	end

	def self.most_recent_version
		# self.
	end

	def self.distinct_users
		self.reorder("").select(:user_id).distinct.map{ |submission| submission.user }
	end

	def self.pending_review
		self.where(reviewed: false)
	end

	def self.not_accepted
		self.where(reviewed: true, correctness: false)
	end

	def self.accepted
		self.where(correctness: true)
	end

	# Returns all other submissions with matching User and Task ID's
	def related_submissions
		self.user.previous_submissions_for(self.task).includes(comments: :user)
	end

	def status
		case
		when self.is_correct? then "Accepted" 
		when self.is_incorrect? then "Not Accepted"
		when self.is_pending_review? then "Pending Review"
		end
	end

	def answer 
		self.submission
	end

	def to_s
		"Submission"
	end

end
