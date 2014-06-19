class Admin::InviteMailer < ActionMailer::Base
  default from: "from@example.com"

	def new_user_invite(invite, url)
	    @invite = invite
	    @url  = url
	    mail(to: @invite.email, subject: "You've been invited to school!")
	end

	def test_email
		mail(to: 'walter@walterlatimer.com', subject: "Hiiiiii")
	end
end
