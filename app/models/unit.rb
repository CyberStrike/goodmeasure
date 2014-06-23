class Unit < ActiveRecord::Base
  belongs_to :cohort
  has_many :tasks

  validates :name, :description, :cohort_id, presence: true
 	
end
