class Invite < ActiveRecord::Base
	belongs_to :school
	before_create :generate_token, :check_if_user_exists

	validates :email, presence: true, 
			uniqueness: { case_sensitive: false },
			format: { with: /\A[^@]+@[^@]+\z/ },
			exclusion: { in: User.all.map(&:email), message: 'is already in use by a current student!' }


	def generate_token
		self.token = Digest::SHA1.hexdigest([self.school_id, Time.now, rand].join)
	end

	def check_if_user_exists
		check = User.find_by(email: self.email)
		raise "User already exists" if check
	end
end
