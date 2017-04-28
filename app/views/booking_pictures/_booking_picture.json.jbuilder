json.extract! booking_picture, :id, :booking_post_id, :created_at, :updated_at
json.url booking_picture_url(booking_picture, format: :json)
