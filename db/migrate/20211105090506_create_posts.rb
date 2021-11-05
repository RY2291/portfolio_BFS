class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :post_image_id
      t.string :title
      t.text :introduction
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :rate

      t.timestamps
    end
  end
end
