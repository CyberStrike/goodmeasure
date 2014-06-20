class AdminController < ApplicationController
	before_action :check_if_admin

	def index
		windex(school.invites.new)
	end


	private
	def check_if_admin
		return true if current_user.admin
		raise ActionController::RoutingError.new("Not Found")
	end

	def windex(invite)
		@cohorts = school.cohorts
		@users = school.users
		@enrollments = school.enrollments
		@invites = school.invites
		@invite = invite
	end	
end
