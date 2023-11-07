class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.text :cover_image
      t.text :image, array: true, default: []
      t.timestamps
    end
  end
end
