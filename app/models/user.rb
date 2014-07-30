class User < ActiveRecord::Base

	has_secure_password
	has_many   :cohorts,       through: :enrollments
	has_many   :comments,      dependent: :destroy
	has_many   :enrollments,   dependent: :destroy
	has_many   :submissions,   dependent: :destroy
	has_many   :user_blockers, dependent: :destroy
	has_many   :blockers,      through: :user_blockers
	belongs_to :school
	belongs_to :role

	validates :password, confirmation: true

	validates :username,   uniqueness: { case_sensitive: false},
                           presence:   true

	validates :first_name, presence:   true, 
                           length:     { minimum: 2 }

	validates :last_name,  presence:   true, 
                           length:     { minimum: 2 }

	validates :email,      presence:   true, 
                           uniqueness: { case_sensitive: false },
                           format:     { with: /\A[^@]+@[^@]+\z/ }

	has_attached_file :avatar,
	  styles:      { medium: "300x300#", thumb: "100x100#" },
	  default_url: "http://www.omse.umd.edu/images/missing.png"

	validates_attachment_content_type :avatar,
	  :content_type => /\Aimage\/.*\Z/

	def role(cohort)
		Role.find(self.enrollments.find_by(cohort: cohort.id).role_id)
	end

	def has_submitted?(task)
		self.submissions.where(task_id: task).exists?
	end

	def has_submitted_before?(task)
		self.submissions.where(task_id: task).count > 1
	end

	def last_submission_for(task)
		self.submissions.where(task_id: task).order(:created_at).first
	end

	def submissions_for(task)
		self.submissions.where(task_id: task).order(:id).includes(comments: :user)
	end

	def previous_submissions_for(task)
		self.submissions.where(task_id: task, reviewed: true).order(:id)
	end

	def has_completed?(task)
		self.has_submitted?(task) &&
		self.last_submission_for(task).has_been_reviewed? &&
		self.last_submission_for(task).is_correct?
	end

	def has_pending_submissions?(task)
		self.has_submitted?(task) &&
		self.last_submission_for(task).has_been_reviewed? == false
	end

	def can_submit?(task)
		self.has_submitted?(task) == false || self.last_submission_for(task).is_incorrect?
	end

	def is_admin?
		self.admin
	end

	def is_instructor?(cohort)
		self.role(cohort).title == "Instructor" || self.is_admin?
	end

	def is_staff?(cohort)
		self.is_instructor?(cohort) || self.role(cohort).title == "TA"
	end	

	def is_ta?(cohort)
		self.role(cohort).title == "TA"
	end

	def is_student?(cohort)
		self.role(cohort).title == "Student"
	end

	def progress_percent(unit)
		unit.tasks.empty? ? 100 : (tasks_completed(unit).to_f / unit.tasks.size * 100).round
	end

	def tasks_completed(unit)
		unit.submissions.accepted.where(user_id: self).size
	end

	def name
		self.first_name + " " + self.last_name
	end
	
	def to_param 
	    username
	end

end