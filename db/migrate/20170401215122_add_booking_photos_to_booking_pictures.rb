class AddBookingPhotosToBookingPictures < ActiveRecord::Migration[5.0]
	def up
	    add_attachment :booking_pictures, :photo
	end

	def down
	    remove_attachment :booking_pictures, :photo
	end
end
