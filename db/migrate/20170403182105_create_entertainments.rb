class CreateEntertainments < ActiveRecord::Migration[5.0]
  def change
    create_table :entertainments do |t|
      t.string :title
      t.text :description
      t.boolean :black
      t.string :title2
      t.text :description2
      t.timestamps
    end
  end
end
