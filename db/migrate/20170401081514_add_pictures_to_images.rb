class AddPicturesToImages < ActiveRecord::Migration[5.0]
	def up
	    add_attachment :images, :picture
	end

	def down
	    remove_attachment :images, :picture
	end
end
