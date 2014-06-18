class Invite < ActiveRecord::Base
	belongs_to :school
	before_create :generate_token, :check_if_user_exists

	validates :email, presence: true, 
			uniqueness: { case_sensitive: false },
			format: { with: /\A[^@]+@[^@]+\z/ }


	def generate_token
		self.token = Digest::SHA1.hexdigest([self.school_id, Time.now, rand].join)
	end

	def check_if_user_exists
		User.find_by(email: self.email)
	end
end
