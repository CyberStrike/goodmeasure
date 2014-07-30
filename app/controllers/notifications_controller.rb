class NotificationsController < ApplicationController


	def index
		@notifications = Notification.where(receiver_id: @current_user.id)
		@notifications.unread.each do |notification|
			notification.unread = false
			notification.save
		end
	end

end
