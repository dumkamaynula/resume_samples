class AddDatesToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :start, :date
    add_column :reservations, :end, :date
  end
end
