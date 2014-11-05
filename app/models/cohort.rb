class Cohort < ActiveRecord::Base

	belongs_to :school
	has_many :enrollments,  dependent: :destroy
	has_many :submissions,  through: :tasks
	has_many :tasks,        through: :units
	has_many :units,        dependent: :destroy
	has_many :users,        through: :enrollments
	has_many :blockers,     dependent: :destroy

	validates :school,      presence: true

	validates :description, presence: true 

	validates :name,        uniqueness: { case_sensitive: false },
                            presence: true   
   
	def students
		self.enrollments.where(role_id: 1).map{ |enrollment| enrollment.user }
	end

	def instructors
		self.enrollments.where(role_id: 3).map{ |enrollment| enrollment.user }
	end

	def staff
		self.enrollments.where(role_id: 2 || 3).map{ |enrollment| enrollment.user }
	end

	def tas
		self.enrollments.where(role_id: 2).map{ |enrollment| enrollment.user }
	end

	def has_users?
		self.users.size > 0
	end

        def unaccepted_submissions
          q = <<-SQL
            SELECT
              users.username AS user_name,
              users.id AS user_id,
              submissions.id AS submission_id,
              submissions.created_at AS created_at,
              tasks.id AS task_id,
              tasks.title AS task_title,
              submissions.correctness AS correct
            FROM users
            RIGHT JOIN enrollments ON
              enrollments.user_id = users.id
            RIGHT JOIN submissions ON
              submissions.user_id = users.id
            RIGHT JOIN tasks ON
              tasks.id = submissions.task_id
            WHERE
              enrollments.cohort_id = #{self.id} 
              AND enrollments.role_id = 1
            ORDER BY
              tasks.id ASC,
              users.id ASC,
              submissions.created_at DESC
          SQL

          rows = self.class.connection.select_all q
          
          listing = Hash.new
          rows.each do |r|
            key = [
                   r['created_at'],
                   r['task_id'],
                   r['user_id']
                  ]

            next if listing.include? key
            
            value = r
            value['submission'] = Submission.find(r['submission_id'])
            value['status'] = value['submission'].status

            listing[key] = value
          end

          return listing.values
        end
end
