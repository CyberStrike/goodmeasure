class SessionController < ApplicationController
  def login
  	if @current_user
  		redirect_to root_path
  	end
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username],params[:login_password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		redirect_to root_path, success: "Welcome back.  You are now logged in as #{authorized_user.username}"
  	else
  		redirect_to :login, error: "Invalid Username or Password"
  	end
  end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end
end
