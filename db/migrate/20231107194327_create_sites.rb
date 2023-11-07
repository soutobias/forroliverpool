class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.text :title
      t.text :description
      t.text :long_description
      t.text :cover_image
      t.text :cover_video
      t.text :image, array: true, default: []
      t.timestamps
    end
  end
end
