class User < ActiveRecord::Base
	belongs_to :school

	def self.authenticate(username="", login_password="")
		user = User.find_by_username(username)
		if user && (user.password == login_password)
			return user
		else
			return false
		end
	end
end
