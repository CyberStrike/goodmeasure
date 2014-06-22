class Unit < ActiveRecord::Base
  belongs_to :cohort
  has_many :tasks


 validates :name, 
 	presence: true

 validates :description, 
 	presence: true

end
