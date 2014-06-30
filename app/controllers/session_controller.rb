class SessionController < ApplicationController

	skip_before_action :redirect_to_login

  def login
  	if @current_user
  		redirect_to 'wyncode.lvh.me'
  	end
  end

  def login_attempt
  	user = User.find_by(username: params[:username]).try(:authenticate, params[:login_password])

  	if user
  		session[:user_id] = user.id
  		redirect_to root_path, flash: { success: "Welcome back.  You are now logged in as #{user.username}" }
  	else
  		render :login, notice: "Invalid Username or Password"
  	end
  end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end
end
