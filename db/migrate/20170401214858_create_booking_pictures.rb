class CreateBookingPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_pictures do |t|
      t.integer :booking_post_id

      t.timestamps
    end
  end
end
