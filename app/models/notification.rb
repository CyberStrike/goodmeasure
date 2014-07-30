class Notification < ActiveRecord::Base
  has_one :sender
  has_one :receiver
  belongs_to :notifiable, polymorphic: true
end
