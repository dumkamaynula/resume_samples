json.extract! cart_item, :id, :shop_item_id, :quantity, :shopping_cart_id, :shop_price, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
