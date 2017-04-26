class BookingPost < ApplicationRecord
	has_many :booking_pictures, dependent: :destroy
	has_many :reservations, dependent: :destroy
end
