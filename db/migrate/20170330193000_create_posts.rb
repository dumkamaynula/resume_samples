class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :title
      t.string :title2
      t.text :description2

      t.timestamps
    end
  end
end
