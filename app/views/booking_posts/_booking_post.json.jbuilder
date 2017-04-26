json.extract! booking_post, :id, :title, :description, :black, :created_at, :updated_at
json.url booking_post_url(booking_post, format: :json)
