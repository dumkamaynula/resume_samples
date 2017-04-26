class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :title2
      t.text :description2

      t.timestamps
    end
  end
end
