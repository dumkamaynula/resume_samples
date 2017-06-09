json.extract! shopping_cart, :id, :user_id, :shop_item_ids, :selected_item_ids, :contact_info_id, :created_at, :updated_at
json.url shopping_cart_url(shopping_cart, format: :json)
