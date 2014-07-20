class Unit < ActiveRecord::Base
  belongs_to :cohort
  has_many :tasks, dependent: :destroy
  has_many :submissions, through: :tasks
  has_many :related_materials, as: :attachable, dependent: :destroy

  validates :name, :description, :cohort_id, presence: true
  validates_inclusion_of :visible, :in => [true, false]

  def has_tasks?
  	self.tasks.size > 0
  end
 	
 def to_s
 	"Unit"
 end
 
end
