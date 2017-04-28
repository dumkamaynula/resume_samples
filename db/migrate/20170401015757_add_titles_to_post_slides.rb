class AddTitlesToPostSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :post_slides, :title, :string
    add_column :post_slides, :title2, :string
  end
end
