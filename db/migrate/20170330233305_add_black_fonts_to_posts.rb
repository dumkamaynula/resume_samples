class AddBlackFontsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :black, :boolean, default: false
  end
end
