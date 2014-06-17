class ApplicationController < ActionController::Base
	before_action :get_school, :get_user, :redirect_to_login


	private

	def get_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		else
			@current_user = nil
		end
	end

	def redirect_to_login
		if @current_user.nil? && request.subdomain != 'www'
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