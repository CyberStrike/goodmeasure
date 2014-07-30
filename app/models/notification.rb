class Notification < ActiveRecord::Base
  has_one :sender, class_name: 'User'
  has_one :receiver, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  def self.unread
  	self.where(unread: true)
  end

  def message
  	if self.notifiable_type == "Submission"
  		if self.notifiable.correctness
  			"#{self.notifiable.graded_by.username} marked your answer to '#{self.notifiable.task.title}' correct."
  		else
			"#{self.notifiable.graded_by.username} marked your answer to '#{self.notifiable.task.title}' incorrect."
  		end
  	else
  		"What"
  	end
  end
end
