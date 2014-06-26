class User < ActiveRecord::Base

	has_secure_password
	has_many :cohorts, through: :enrollments
	has_many :comments, dependent: :destroy
	has_many :enrollments, dependent: :destroy
	has_many :submissions, dependent: :destroy
	belongs_to :school
	belongs_to :role

	has_attached_file :avatar,
	  styles: { medium: "300x300#", thumb: "100x100#" },
	  default_url: "http://www.omse.umd.edu/images/missing.png"

	validates_attachment_content_type :avatar,
	  :content_type => /\Aimage\/.*\Z/

	validates :username,
	  uniqueness: { case_sensitive: false},
	  presence: true

	validates :first_name,
	  presence: true, 
	  uniqueness: { case_sensitive: false }, 
	  length: { minimum: 2 }

	validates :last_name,
	  presence: true, 
	  uniqueness: { case_sensitive: false }, 
	  length: { minimum: 2 }

	validates :email,
	  presence: true, 
	  uniqueness: { case_sensitive: false },
	  format: { with: /\A[^@]+@[^@]+\z/ }

	def role(cohort)
		Role.find(self.enrollments.find_by(cohort: cohort.id).role_id)
	end

	def has_submitted?(task)
		!self.submissions.find_by(task_id: task.id).nil?
	end

	def submission_for(task)
		self.submissions.find_by(task_id: task.id)
	end
end













