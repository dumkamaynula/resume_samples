class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :booking_post_id
      t.string :email
      t.string :phone_number
      t.string :name

      t.timestamps
    end
  end
end
