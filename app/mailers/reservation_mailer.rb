class ReservationMailer < ApplicationMailer
	def fresh_message(saved_reservation, email)
		@saved_reservation = saved_reservation
	    @email = email
	    mail to: @email, subject: "New booking request from your website"
  	end

end
