class Blocker < ActiveRecord::Base
  belongs_to :cohort
  has_many :user_blockers
  has_many :users, through: :user_blockers

  validates :blocker, presence: true

  def self.from_today
  	self.where("created_at >= ?", Date.today.beginning_of_day)
  end
end
