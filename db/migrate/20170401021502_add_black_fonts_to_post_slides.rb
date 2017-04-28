class AddBlackFontsToPostSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :post_slides, :black, :boolean
  end
end
