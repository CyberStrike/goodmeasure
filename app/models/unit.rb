class Unit < ActiveRecord::Base
  belongs_to :cohort
  has_many :tasks, dependent: :destroy
  has_many :submissions, through: :tasks

  validates :name, :description, :cohort_id, presence: true

  def has_tasks?
  	self.tasks.size > 0
  end
 	
end
