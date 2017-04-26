class AddPhotosToEntertainments < ActiveRecord::Migration[5.0]
	def up
	    add_attachment :entertainments, :photo
	end

	def down
	    remove_attachment :entertainments, :photo
	end

end
