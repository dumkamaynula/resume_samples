json.extract! reservation, :id, :booking_post_id, :email, :phone_number, :name, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
