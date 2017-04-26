class CreatePostSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :post_slides do |t|
      t.string :description
      t.integer :position_id
      t.string :description2
      
      t.timestamps
    end
  end
end
