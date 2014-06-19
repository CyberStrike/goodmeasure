class AdminController < ApplicationController
	before_action :check_if_admin

	def index
		@cohorts = school.cohorts
		@users = school.users
		@enrollments = school.enrollments
		@invites = school.invites
		@invite = school.invites.new
	end

	private
	def check_if_admin
		return true if current_user.admin
		raise ActionController::RoutingError.new("Not Found")
	end
end
