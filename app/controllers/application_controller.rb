class ApplicationController < ActionController::Base
	before_action :get_school


	private

	def get_school
		school = School.find_by subdomain: request.subdomain
		if school
			@school = school
		elsif request.subdomain != 'www'
			redirect_to root_url(subdomain: 'www')
		end
	end

	protect_from_forgery with: :exception
end
