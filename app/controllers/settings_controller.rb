class SettingsController < ApplicationController
	def update_profile

		with_password = new_password_params[:password] != ""

		respond_to do |format|
			if @current_user.try(:authenticate, current_password_params[:current_password]) && @current_user.update(profile_params with_password)
				format.html { redirect_to settings_profile_path, notice: 'Profile was successfully updated.' }
			else
				format.html { render :profile }
			end
		end
	end

	def profile
	end

  	private

	def profile_params(with_password)
		if with_password
			params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :avatar)
		else
			params.require(:user).permit(:username, :first_name, :last_name, :email, :avatar)
		end
	end

	def current_password_params
		params.require(:user).permit(:current_password)
	end

	def new_password_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end