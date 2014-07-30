class UserBlocker < ActiveRecord::Base
  belongs_to :user
  belongs_to :blocker

  before_create do
  	self.active = true
  end
end
