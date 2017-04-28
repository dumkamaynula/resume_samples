class Reservation < ApplicationRecord
	belongs_to :booking_post
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
	validates :name, :email, :phone_number, :start, :end, presence: true
	validate :date_cannot_be_in_the_past, :end_greater_than_start
	#before_save :my_date
	

  

	private

		def my_date
			self.start = self.start.strftime("%d/%m/%Y")
	  		self.end = self.end.strftime("%d/%m/%Y")
		end
		def date_cannot_be_in_the_past
	    	if self.start.present? and self.start < Date.today
	      		errors.add(:start, "can't be in the past")
	    	end
	       	if self.end.present? and self.end < Date.today
	   		   	errors.add(:end, "can't be in the past")
	    	end
	  	end
	  	def end_greater_than_start
	  		if self.start.present? and self.end.present? and self.end < self.start
	   		   	errors.add(:end, "can't be less than start")
	    	end
	  		
	  	end
end
