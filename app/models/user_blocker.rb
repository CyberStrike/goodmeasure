class UserBlocker < ActiveRecord::Base
  belongs_to :user
  belongs_to :blocker

  validates_uniqueness_of :user, scope: [:blocker]

  before_create do
  	self.active = true
  end
end
