class ApplicationController < ActionController::Base
	before_action :get_school, :current_user, :redirect_to_login


	private

	def current_user
		@current_user ||= User.find(session[:user_id]) rescue nil
	end

	def redirect_to_login
		if current_user.nil? && request.subdomain != 'www'
			redirect_to '/login'
		end
	end

	def get_school
		school = School.find_by subdomain: request.subdomain
		if school
			@school = school
		elsif request.subdomain != 'www'
			@school = nil
			redirect_to root_url(subdomain: 'www')
		end
	end

	protect_from_forgery with: :exception
end