class AdminController < ApplicationController
	before_action :check_if_admin

	def new
		@admin = Admin.new
	end

	private
	def check_if_admin
		return true if current_user.admin
		raise ActionController::RoutingError.new("Not Found")
	end
end
