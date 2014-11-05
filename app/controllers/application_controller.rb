class ApplicationController < ActionController::Base
	before_action :school, :current_user, :redirect_to_login
	helper_method :current_user, :me_or_admin?

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) rescue nil
	end

  def me_or_admin?(user)
    u = current_user
    u.admin? or u == user
  end

	def redirect_to_login
		if current_user.nil? && request.subdomain != 'www'
			redirect_to '/login'
		end
	end

  def school
    return @school unless @school.nil?

    @school = School.find_by_name 'Wyncode'
    if @school.nil?
      redirect_to 'wyncode.co'
    end
  end

	protect_from_forgery with: :exception
end

## any method you don't want called over the internet make private
## public methods are publicly accessible actions
