class Unit < ActiveRecord::Base
  belongs_to :cohort
  has_many :tasks
end
