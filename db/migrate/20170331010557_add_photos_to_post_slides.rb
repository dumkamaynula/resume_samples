class AddPhotosToPostSlides < ActiveRecord::Migration[5.0]
	def up
	    add_attachment :post_slides, :photo
	end

	def down
	    remove_attachment :post_slides, :photo
	end
end
