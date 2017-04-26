class AddBlackFontsToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :black, :boolean
  end
end
