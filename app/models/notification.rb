class Notification < ActiveRecord::Base
  has_one :sender, class_name: 'User'
  has_one :receiver, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  def self.unread
  	self.where(unread: true)
  end
end
