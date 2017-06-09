json.extract! shopping_contact, :id, :shopping_cart_id, :user_id, :state, :zip_code, :adress, :email, :phone, :created_at, :updated_at
json.url shopping_contact_url(shopping_contact, format: :json)
